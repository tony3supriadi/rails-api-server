class Api::BookController < ApplicationController

    # Menampilkan semua data buku
    # GET: /api/books
    def index
        @books = Book.all
        render json: { 
            message: "success",
            results: @books
        }, status: :ok
    end

    # Membuat data buku baru
    # POST: /api/books
    def create
        @book = Book.new(book_params)
        if @book.save
            render json: {
                message: 'success',
                result: @book
            }, status: :created
        else
            render json: {
                message: 'failed',
                result: null,
            }, status: :bad_request
        end
    end

    # Private method untuk kebutuhan controllers
    private 

        # Inisialisasi data field table buku
        def book_params
            params.permit(:title, :author, :description)
        end
end
