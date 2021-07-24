require 'sinatra'
require_relative './model/category'
require_relative './model/item'
require_relative './controllers/item_controller'
require_relative './controllers/category_controller'


get "/" do 
    # redirect "/items"
    controller = ItemController.new
    controller.items
end

# get "/items" do
#     controller = ItemController.new
#     controller.items
# end

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

# get "/category/new" do
#     controller = CategoryController.new
#     controller.new_category
# end

# post "/category/create" do 
#     controller = CategoryController.new
#     controller.create_category(params)
#     redirect "/category"
# end



# # daftar semua item yang termasuk dalam kategori
# get "/category/items" do
#     controller = ItemController.new
#     controller.all_items_with_category
# end

