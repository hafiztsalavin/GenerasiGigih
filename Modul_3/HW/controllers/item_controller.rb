require './model/item'
require './model/category'

class ItemController
    def items
        items = Item::get_all_items
        renderer = ERB.new(File.read("./views/index.erb"))
        renderer.result(binding)
    end

    def new_item
        categories = Category::get_all_categories
        renderer = ERB.new(File.read("./views/item/create.erb"))
        renderer.result(binding)
    end

    def detail(params)
        id = params["id"]
        items = Item::detail_item(id)
        renderer = ERB.new(File.read("./views/item/detail.erb"))
        renderer.result(binding)
    end
        
    def create_item(params)
        new_item = Item::insert_item(params["name"],params["price"],params["category"])
    end
    
    def edit_item(params)
        id = params["id"]
        categories = Category::get_all_categories
        items = Item::detail_item(id)
        renderer = ERB.new(File.read("./views/item/edit.erb"))
        renderer.result(binding)
    end
    
    def update_item(params)
        edit = Item::update_item(params["id"],params["name"],params["price"],params["category"])
    end

    def delete_item(params)
        item = Item::delete_item(params["id"])
    end

    def all_items_with_category
        items = Item::all_items_category
        renderer = ERB.new(File.read("./views/item/category.erb"))
        renderer.result(binding)
    end
end
