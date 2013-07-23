get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :form_field
end

post '/events/create' do
  event = Event.new(title: params[:title], date: params[:date], organizer_name: params[:name])
  event.save
  if event.invalid?
    if event.errors.messages[:date] 
      p "first"
      date = event.errors.messages[:date]
    end
    if event.errors.messages[:title] 
      p "second"
      name = event.errors.messages[:title]
    end
    if event.errors.messages[:organizer_name]
      p "third"
      title = event.errors.messages[:organizer_name] 
    end
    if event.valid?
      redirect '/'
    end
  end
  content_type :json
  { date: date, name: name, title: title}.to_json
end
