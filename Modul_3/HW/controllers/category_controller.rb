require './model/item'
require './model/category'

class CategoryController

    def categories
        categories = Category::get_all_categories
        renderer = ERB.new(File.read("./views/category/categories.erb"))
        renderer.result(binding)
    end
    
    def new_category
        renderer = ERB.new(File.read("./views/category/create_category.erb"))
        renderer.result(binding)
    end

    def create_category(params)
        new_cat = Category::insert_category(params["name"])
    end

    def edit_category(params)
        id = params['id']
        categories = Category::detail_category(id)
        renderer = ERB.new(File.read("./views/category/update.erb"))
        renderer.result(binding)
    end

    def update_category(params)
        edit = Category::update_category(params["id"],params["name"])
    end

    def category_detail(params)
        id = params["id"]
        category = Category::detail_category_item(id)
        renderer = ERB.new(File.read("./views/category/detail.erb"))
        renderer.result(binding)
    end

    def delete_category(params)
        category = Category::delete_category(params["id"])
    end

end