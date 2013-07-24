get '/' do
  redirect '/events'
end

get '/events' do
  @events = Event.all
  erb :"events/index"
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :"events/show"
end

get '/events/new' do
  @event = Event.new
  erb :"events/new"
end

post '/events' do
  content_type :json
  # p params
  # event = Event.new(title: params[:title], date: params[:date], organizer_name: params[:name], organizer_email: params[:email])

  event_attributes = params.slice(*%w{title date organizer_name organizer_email})
  event = Event.new(event_attributes)
  
  if event.save
    status 200
    event.to_json
    # { date: date, name: name, title: title, email: email}.to_json
  else
    status 422
    event.errors.to_json
  end
end

  # 
    # if event.errors.messages[:date] 
    #   p "first"
    #   date = event.errors.messages[:date]
    # end
    # if event.errors.messages[:title] 
    #   p "second"
    #   name = event.errors.messages[:title]
    # end
    # if event.errors.messages[:organizer_name]
    #   p "third"
    #   title = event.errors.messages[:organizer_name] 
    #   p title
    # end
    # if event.errors.messages[:organizer_email]
    #   p "fourth"
    #   email = event.errors.messages[:organizer_email] 
    #   p email
    # end
    # if event.valid?
    #   redirect '/'
    # end
  # end
  
  
# end
