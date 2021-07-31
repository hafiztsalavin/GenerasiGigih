require 'sinatra'
require_relative './model/category'
require_relative './model/item'
require_relative './controllers/item_controller'
require_relative './controllers/category_controller'


get "/" do 
    ItemController.items
end

# new items 
get "/items/new" do
    ItemController.new_item()
end

# detail
get "/items/:id" do
    ItemController.detail(params)
end

# edit
get "/items/:id/edit" do
    ItemController.edit_item(params)
end

#POST new items
post "/items/create" do
    ItemController.create_item(params)
    redirect "/"
end

#POST edit
post "/items/:id" do
    ItemController.update_item(params)
    redirect "/"
end

# delete
delete '/items/:id' do
    ItemController.delete_item(params)
    redirect "/"
end


# CATEGORY

# list category
get "/category" do
    CategoryController.categories
end

# view new category
get "/category/new" do
    CategoryController.new_category
end

# post new category
post "/category/create" do 
    CategoryController.create_category(params)
    redirect "/category"
end

# edit
get "/category/:id/edit" do
    CategoryController.edit_category(params)
end

# post edit category
post "/category/:id" do
    CategoryController.update_category(params)
    redirect "/category"
end

# detail category
get "/category/:id" do
    CategoryController.category_detail(params)
end

# hapus
delete '/category/:id' do
    CategoryController.delete_category(params)
    redirect "/category"
end




