require 'rails_helper'

RSpec.describe "Books", type: :request do
  context "GET /api/books" do
    it 'returns a succeess response' do
      get '/api/books'
      expect(response).to have_http_status(200)
    end
  end

  context "POST /api/books" do
    it 'return a success created' do
      post '/api/books', :params => { "title": "book title", "author": "author name", "description" => ""}
      expect(response).to have_http_status(201)
    end

    it 'return failed when title not presence' do
      post '/api/books', :params => { "author": "author name", "description" => ""}
      expect(response).to have_http_status(:bad_request)
    end

    it 'return failed when author not presence' do
      post '/api/books', :params => { "title": "book title", "description" => ""}
      expect(response).to have_http_status(:bad_request)
    end
  end

  context "GET /api/books/:id" do
    it 'return a success response' do
      @book = Book.create!(title: 'book title', author: 'author name', description: '')
      get '/api/books/' + @book.id.to_s
      expect(response).to have_http_status(200)
    end

    it 'return a not found response' do
      get '/api/books/0'
      expect(response).to have_http_status(404)
    end
  end

  context "PUT /api/books/:id" do
    it 'return a success updated' do
      @book = Book.create!(title: 'book title', author: 'author name', description: '')
      put '/api/books/' + @book.id.to_s, :params => { "title": "new book title", "author": "new author name", "description" => ""}
      expect(response).to have_http_status(201)
    end

    it 'return update with data not found' do
      put '/api/books/0', :params => { "title": "new book title", "author": "new author name", "description" => ""}
      expect(response).to have_http_status(:not_found)
    end
  end

  context "DELETE /api/books/:id" do
    it 'return a success deleted' do
      @book = Book.create!(title: 'book title', author: 'author name', description: '')
      put '/api/books/' + @book.id.to_s
      expect(response).to have_http_status(201)
    end

    it 'return update with data not found' do
      put '/api/books/0'
      expect(response).to have_http_status(:not_found)
    end
  end
end
