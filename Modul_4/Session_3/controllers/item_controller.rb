require './model/item'
require './model/category'

class ItemController
    def self.items()
        items = Item.get_all_items
        renderer = ERB.new(File.read("./views/index.erb"))
        renderer.result(binding)
    end

    def self.new_item()
        categories = Category.get_all_categories
        renderer = ERB.new(File.read("./views/item/create.erb"))
        renderer.result(binding)
    end
    
    def self.create_item(params)
        # new_item = Item::insert_item(params["name"],params["price"],params["category"])
        name = params['name']
        price = params['price']
        category = params['category']
        item = Item.new(nil, name, price, category)
        item.insert_item(name, price, category)

    end

    def self.detail(params)
        id = params["id"]
        items = Item.detail_item(id)
        renderer = ERB.new(File.read("./views/item/detail.erb"))
        renderer.result(binding)
    end
        
    
    def self.edit_item(params)
        id = params["id"]
        categories = Category.get_all_categories
        items = Item.detail_item(id)
        renderer = ERB.new(File.read("./views/item/edit.erb"))
        renderer.result(binding)
    end
    
    def self.update_item(params)
        id = params["id"]
        name = params["name"]
        price = params["price"]
        category = params["category"]

        Item.update_item(id, name, price, category)
    end

    def self.delete_item(params)
        id = params["id"]
        item = Item.delete_item(id)
    end

    def all_items_with_category
        items = Item::all_items_category
        renderer = ERB.new(File.read("./views/item/category.erb"))
        renderer.result(binding)
    end
end
