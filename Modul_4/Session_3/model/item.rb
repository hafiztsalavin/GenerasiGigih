require_relative '../db/db_connector'
require_relative '../model/category'
class Item
    attr_reader :id, :name, :price, :category

    def initialize(id, name, price, category=nil)
        @id = id
        @name = name
        @price = price
        @category = category
    end

    def valid?
        return false if @name.nil?
        return false if @price.nil?
        true
    end

    def self.get_all_items
        client = create_db_client
        rawData = client.query("select * from items")
        items = Array.new
        rawData.each do |data|
            item = Item.new(data["id"], data["name"], data["price"])
            items.push(item)
        end
        items
    end

    def insert_item(name, price, category)
        return false unless valid?
        client = create_db_client
        new_item = client.query("insert into items (name, price) values ('#{name}', #{price})")
        new_category = client.query("insert into item_categories (item_id, category_id) values ( LAST_INSERT_ID(), '#{category}')")
    end

    def self.detail_item(id)
        client = create_db_client
        rawData = client.query("
            select items.id as id, items.name as name, items.price as price, categories.name as category_name
            from items 
            join item_categories on items.id = item_categories.item_id 
            join categories  on item_categories.category_id = categories.id
            where items.id='#{id}';
        ")
        item_detail = Array.new
        rawData.each do |data|
            item = Item.new(data["id"], data["name"], data["price"], data["category_name"])
            item_detail.push(item)
        end
        item_detail
    end
    
    def self.update_item(id, name, price, category)
        client = create_db_client
        update = client.query("
        update  items 
            join item_categories on items.id = item_categories.item_id 
            join categories  on items.id = categories.id 
        set items.name = '#{name}', items.price = '#{price}', item_categories.category_id ='#{category}' 
        where items.id = '#{id}'
        ")
    
        update
    end
    
    def self.delete_item(id)
        client = create_db_client
        delete = client.query("
            delete from items where id=#{id}
        ")
    
        delete
    end
end