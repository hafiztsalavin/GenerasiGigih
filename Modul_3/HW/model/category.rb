require_relative '../db/db_connector'


class Category
    attr_reader :id, :name

    def initialize(id, name)
        @id = id
        @name = name        
    end

    def self.get_all_categories
        client = create_db_client
        rawData = client.query("select * from categories")
        categories = Array.new
        rawData.each do |data|
            category = Category.new(data["id"], data["name"])
            categories.push(category)
        end
        categories
    end

    def self.insert_category(category)
        client = create_db_client
        new_category = client.query("insert into categories (name) values ('#{category}')")
    end

    def self.detail_category(id)
        client = create_db_client
        rawData = client.query("
            select * 
                from categories 
            where categories.id = '#{id}'")
        category_detail = Array.new
        rawData.each do |data|
            category = Category.new(data["id"], data["name"])
            category_detail.push(category)
        end
        category_detail
    end

    def self.update_category(id, name)
        client = create_db_client
        updateData = client.query("
        update categories 
            set categories.name = '#{name}' where categories.id = #{id}")
        updateData
    end

    def self.detail_category_item(id)
        client = create_db_client
        rawData = client.query("
            select items.id as id, items.name as name, items.price as price, categories.name as category_name
                from items 
            join item_categories on items.id = item_categories.item_id 
            join categories  on item_categories.category_id = categories.id
                where items.id='#{id}';
        ")
        category_detail = Array.new
        rawData.each do |data|
            category = Category.new(data["id"], data["name"])
            item = Item.new(data["id"], data["name"], data["price"], data["category_name"])
            category_detail.push(item)
        end
        category_detail
    end

    def self.delete_category(id)
        client = create_db_client
        delete = client.query("
            delete from categories where id=#{id}
        ")
    
        delete
    end

    

end