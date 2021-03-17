class Api::BookController < ApplicationController

    # Menampilkan semua data buku
    # GET: /api/books
    def index
        @books = Book.all
        render json: { 
            message: "success",
            results: @book
        }, status: :ok
    end
end
