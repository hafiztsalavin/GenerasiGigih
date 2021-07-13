require 'sinatra'


get '/messages/:name' do
    name = params['name']
    color = params['color'] ? params['color']:'DodgerBlue'
    erb :message, locals: {
        color: color,
        name: name
    }
end

# get '/messages/:name' do
#     name = params['name']
#     "<h1> hello #{name}</h1>"
# end


# kalo ada params di pake kalo tidak pake yang default
# get '/messages/:name' do
#     name = params['name']
#     color = params['color'] ? params['color']:'DodgerBlue'
#     "<h1 style=\"background-color:#{color};\">hello #{name}!</h1>"
# end


# data di lempar ke message

post '/login' do
    if params['username'] == 'admin' && params['password'] == 'admin'
        return 'Loggin in'
    else 
        redirect '/login'
    end
end

get '/login' do
    erb :login
end


items = [
    {name: "susu", price: 10000},
    {name: "bear breand", price: 15000}
]


get "/items" do
    erb :items, locals:{
        items: items
    }
end

post "/items" do
    name = params["name"]
    price = params["price"]
    items << {name: name, price: price}
    redirect "/items"

end


