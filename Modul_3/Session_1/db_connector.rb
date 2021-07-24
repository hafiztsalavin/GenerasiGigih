require 'mysql2'
require './item'
require './category'

# orm untuk connection db
# connection pull (untuk reuse)

# connector db
def create_db_client
    client = Mysql2::Client.new(
        :host => "localhost",
        :username => ENV["DB_USERNAME"],
        :password => ENV["DB_PASSWORD"],
        :database => ENV["DB_NAME"]
    )

    client
end

# komunikasi dg database
# dapet data lempar ke router(web.rb) terus di render di erb
def get_all_items
    client = create_db_client
    rawData = client.query("SELECT * FROM items")
    items = Array.new
    rawData.each do |data|
        item = Item.new(data["id"], data["name"], data["price"])
        items.push(item)
    end
    items
end

# lempar data
def get_all_categories
    client = create_db_client
    rawData = client.query("SELECT * FROM categories")
    categories = Array.new
    rawData.each do |data|
        category = Category.new(data["id"], data["name"])
        categories.push(category)
    end
    categories
end

def get_all_items_with_categories
    client = create_db_client
    rawData = client.query("SELECT items.id, items.name, items.price, categories.id AS category_id, category.name AS category_name
        FROM items
        JOIN item_categories ON items.id = item_categories.item_id
        JOIN categories ON item_categories.category_id = categories.id
    ")
    items = Array.new
    rawData.each do |data|
        category = Category.new(data["category_id"], data["category_name"])
        item = Items.new(data["id"], data["nama"], data["price"], category)
        items.push(item)
    end
    items
end

def insert_item(name, price)
    client = create_db_client
    client.query("INSERT INTO items (name, price) VALUES ('#{name}', #{price})")
end

def detail_item(id)
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

def update_item(id, name, price, category)
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

def delete_item(id)
    client = create_db_client
    delete = client.query("
        delete from items where id=#{id}
    ")

    delete
end