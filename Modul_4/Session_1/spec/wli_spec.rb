require 'rspec'
require_relative '../src/wli'

RSpec.describe Wli do
    it 'kosong' do
        # given / spesifikasi
        wli = Wli.new
        
        # when / saat jalan
        wli.names = []
        like = wli.likes
    
        # then / ekspektasi
        expect(like).to eq("no one like this")
    end


    it 'return 1 array' do
        # given / spesifikasi
        wli = Wli.new
        
        # when / saat jalan
        wli.names = ['Peter']
        like = wli.likes
    
        # then / ekspektasi
        expect(like).to eq("Peter like this")
    end


    it 'return 2 array' do
        # given / spesifikasi
        wli = Wli.new
        
        # when / saat jalan
        wli.names = ['Jacob', 'Alex']
        like = wli.likes

        # then / ekspektasi
        expect(like).to eq("Jacob and Alex like this")
    end

    it 'return 3 array' do
        # given / spesifikasi
        wli = Wli.new
        
        # when / saat jalan
        wli.names = ['Jacob', 'Alex', 'Daniel']
        like = wli.likes

        # then / ekspektasi
        expect(like).to eq("Jacob Alex and Daniel like this")
    end

    it 'return more 3 array' do
        # given / spesifikasi
        wli = Wli.new
        
        # when / saat jalan
        wli.names = ['Jacob', 'Alex', 'Daniel', "Max"]
        like = wli.likes

        # then / ekspektasi
        expect(like).to eq("Jacob Alex and 2 others like this")
    end


end