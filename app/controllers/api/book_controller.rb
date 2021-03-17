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
    def store
        @book = Book.new(book_params)
        if @book.save
            render json: {
                type: 'success',
                result: @book
            }, status: :created
        else
            render json: {
                type: 'failed',
                message: @book.errors,
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
                message: 'data with id:' + params[:id] + ' not found',
                result: {},
            }, status: :not_found
        end
    end

    # Mengubah data buku berdasarkan :id
    # PUT: /api/books/:id
    def update
        @book = Book.find_by_id(params[:id])

        if @book.present?
            if @book.update(book_params)
                render json: {
                    type: 'success',
                    result: @book
                }, status: :created
            else
                render json: {
                    type: 'failed',
                    message: @book.errors,
                    result: {}
                }, status: :bad_request
            end
        else
            render json: {
                type: 'failed',
                message: 'data with id:' + params[:id] + ' not found',
                result: {},
            }, status: :not_found
        end
    end

    # Menghapus data buku
    # DELETE: /api/books/:id
    def destroy
        @book = Book.find_by_id(params[:id])
        if @book.present?
            if @book.destroy
                render json: {
                    type: 'success',
                    result: {}
                }, status: :created
            else 
                render json: {
                    type: 'failed',
                    message: @book.errors,
                    result: {}
                }, status: :bad_request
            end
        else
            render json: {
                type: 'failed',
                message: 'data with id:' + params[:id] + ' not found',
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
