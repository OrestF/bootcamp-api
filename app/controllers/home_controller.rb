class HomeController < ApplicationController
  def index
    render json: { message: 'hello' }
  end

  def users
    @users = User.all
    render json: @users.as_json(include: { books: { except: :id}}, root: true)
  end

  api :GET, '/home/books'
  param :book_id, Integer, desc: 'Book id', required: true
  description 'Book resource'
  def books
    Book.find(params[:book_id])
  end

end
