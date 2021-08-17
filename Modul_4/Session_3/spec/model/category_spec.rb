require './model/category'

describe Category do
    describe '#valid?' do
        context 'when initialized with valid input' do
            it 'should return true' do
                category = Category.new({
                    id: 1,
                    name: "Main dish"
                })
                expect(category.valid?).to eq(true)
            end
        end
    end
end