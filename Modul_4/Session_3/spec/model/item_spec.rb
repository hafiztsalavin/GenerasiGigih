require './model/item'

describe Item do
    describe '#valid?' do
        context "with invalid input" do
            it 'should return false if params empty' do
                item = Item.new({
                    'id' => '',
                    'name' => '',
                    'price' => '',
                    'category' => '',
                })
                result = item.valid?
                expect(result).to eq(false)
            end
        end
    end
end