require './model/order'

describe Order do
    describe '#valid?' do
        context 'when initialized with valid input' do
            it 'should return true' do
                order = Order.new({
                    order_id: "2",
                    customer_id: "1",
                    create_date: "2021-07-20"
                })
                expect(order.valid?).to eq(true)
            end
        end
    end
end