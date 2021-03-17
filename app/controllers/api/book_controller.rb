class Api::BookController < ApplicationController

    # Menampilkan semua data buku
    # GET: /api/books
    def index
        @books = Book.all
        render json: { 
            type: "success",
            results: @books
        }, status: :ok
    end

    # Membuat data buku baru
    # POST: /api/books
    def create
        @book = Book.new(book_params)
        if @book.save
            render json: {
                type: 'success',
                result: @book
            }, status: :created
        else
            render json: {
                type: 'failed',
                message: 'Gagal menambahkan data buku.',
                result: {},
            }, status: :bad_request
        end
    end

    # Menampilkan data buku berdasarkan :id
    # GET: /api/books/:id
    def show
        @book = Book.find_by_id(params[:id])
        if @book.present?
            render json: {
                type: 'success',
                result: @book
            }, status: :ok
        else
            render json: {
                type: 'failed',
                message: 'Buku #id:' + params[:id] + ' tidak ditemukan',
                result: {},
            }, status: :not_found
        end
    end

    # Private method untuk kebutuhan controllers
    private 

        # Inisialisasi data field table buku
        def book_params
            params.permit(:title, :author, :description)
        end
end
