require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'validation test' do
    it 'ensures title presence' do
      @book = Book.new(author: 'author name').save
      expect(@book).to eq(false)
    end

    it 'ensures author presence' do
      @book = Book.new(title: 'book title').save
      expect(@book).to eq(false)
    end

    it 'should save successfully' do
      @book = Book.new(title: 'book title', author: 'author name', description: '').save
      expect(@book).to eq(true)
    end
  end
end
