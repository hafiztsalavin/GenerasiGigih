# ambil dari variabel private
# camelCase untuk variabel , dan snake_case untuk method
# singular untuk class

class Item
    attr_reader :id, :name, :price, :category

    def initialize(id, name, price,category = nil)
        @id = id
        @name = name
        @price = price
        @category = category
    end
end