require_relative '../src/martabak'


RSpec.describe Martabak do
    it 'is delicious' do
        # given / spesifikasi
        martabak = Martabak.new('cokelat')
        
        # when / saat jalan
        taste = martabak.taste

        # then / ekspektasi
        expect(taste).to eq("martabak cokelat is delicious")
    end
end