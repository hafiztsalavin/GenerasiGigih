require_relative '../db/db_connector'

class Order
    attr_accessor :order_id, :customer_id, :create_date

    def initialize(param)
        @order_id = param[:order_id]
        @customer_id = param[:customer_id]
        @create_date = param[:create_date]
    end

    def save
        return false unless valid?
        client = create_db_client
        client query("INSERT INTO orders(order_id, customer_name, create_date) values ('#{order_id}'),('#{customer_id}'), ('#{create_date}')")
    end

    def valid?
        return false if @order_id.nil?
        return false if @customer_id.nil?
        return false if @create_date.nil?
        true
    end
end