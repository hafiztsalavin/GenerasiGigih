require 'sinatra'
require './model/item'
require './model/category'


get '/' do 
    items = Item.get_all_items
    erb :index, locals: {
        items: items
    }
end

get '/items/new' do
    category = Category.get_all_categories
    erb :create, locals: {
        categories: category
    }
end

post '/items/create' do
    name = params['name']
    price = params['price']
    category = params['category']
    Item.insert_item(name, price, category)
    redirect '/'
end

get '/items/:id' do
    items = Item.detail_item(params[:id])
    erb :detail, locals: {
        items: items
    }
end

get '/items/:id/edit' do
    id = params[:id]
    items = Item.detail_item(id)
    category = Category.get_all_categories
    erb :edit, locals: {
        items: items,
        categories: category
    }
end

post '/items/:id' do
    id = params['id']
    name = params['name']
    price = params['price']
    category = params['category']
    Item.update_item(id, name, price, category)
    redirect "/"
end

delete '/items/:id' do
    item = Item.delete_item(params[:id])
    redirect "/"
end