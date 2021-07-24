require 'sinatra'
require_relative './model/category'
require_relative './model/item'
require_relative './controllers/item_controller'
require_relative './controllers/category_controller'


get "/" do 
    controller = ItemController.new
    controller.items
end

get "/items/new" do
    controller = ItemController.new
    controller.new_item
end

post "/items/create" do
    controller = ItemController.new
    controller.create_item(params)
    redirect "/"
end

get "/items/:id" do
    controller = ItemController.new
    controller.detail(params)
end

get "/items/:id/edit" do
    controller = ItemController.new
    controller.edit_item(params)
end

post "/items/:id" do
    controller = ItemController.new
    controller.update_item(params)
    redirect "/"
end

delete '/items/:id' do
    controller = ItemController.new
    controller.delete_item(params)
    redirect "/items"
end


# CATEGORY

get "/category" do
    controller = CategoryController.new
    controller.categories
end

get "/category/new" do
    controller = CategoryController.new
    controller.new_category
end

post "/category/create" do 
    controller = CategoryController.new
    controller.create_category(params)
    redirect "/category"
end

get "/category/:id/edit" do
    controller = CategoryController.new
    controller.edit_category(params)
end

get "/category/:id" do
    controller = CategoryController.new
    controller.category_detail(params)
end

post "/category/:id" do
    controller = CategoryController.new
    controller.update_category(params)
    redirect "/category"
end

delete '/category/:id' do
    controller = CategoryController.new
    controller.delete_category(params)
    redirect "/category"
end




