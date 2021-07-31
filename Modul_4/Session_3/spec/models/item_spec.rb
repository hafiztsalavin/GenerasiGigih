require './model/item'

describe Item do
    describe '#valid?' do
        context 'when initialized with valid input' do
            it 'should return true' do
                item = Item.new({
                    id: 50,
                    name: 'Nasi Goreng',
                    price: 4000
                })
                expect(item.valid?).to be (true)
            end
        end
    end
end