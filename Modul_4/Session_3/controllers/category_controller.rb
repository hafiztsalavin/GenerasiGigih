require './model/item'
require './model/category'

class CategoryController

    def self.categories()
        categories = Category.get_all_categories
        renderer = ERB.new(File.read("./views/category/categories.erb"))
        renderer.result(binding)
    end
    
    def self.new_category()
        renderer = ERB.new(File.read("./views/category/create_category.erb"))
        renderer.result(binding)
    end

    def self.create_category(params)
        name = params['name']
        category = Category.new(nil, name)
        category.insert_category(name)
    end

    def self.edit_category(params)
        id = params['id']
        categories = Category.detail_category(id)
        renderer = ERB.new(File.read("./views/category/update.erb"))
        renderer.result(binding)
    end

    def self.update_category(params)
        id = params["id"]
        name = params["name"]
        Category.update_category(id, name)
    end

    def self.category_detail(params)
        id = params["id"]
        category = Category.detail_category_item(id)
        renderer = ERB.new(File.read("./views/category/detail.erb"))
        renderer.result(binding)
    end

    def self.delete_category(params)
        id = params['id']
        Category.delete_category(id)
    end

end