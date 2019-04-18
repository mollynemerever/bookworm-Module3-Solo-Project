class Api::V1::UsersbooksController < ActionController::Base
  skip_before_action :verify_authenticity_token

  @@all = []

  def create
    @usersbooks = Usersbooks.find_or_create_by(usersbooks_params)
    @@all << @usersbooks
    render json: @usersbooks
  end

  def show
    @usersbooks = Usersbooks.where(user_id: params[:id])
    render json: @usersbooks
  end

  def destroy
    @usersbooks = Usersbooks.where(user_id: params[:user_id], book_id: params[:book_id])
    Usersbooks.delete(@usersbooks)
  end

  def update
    @usersbooks = Usersbooks.where(id: params[:id])
    @usersbooks.update(read_status: params[:read_status])
  end

  private

  def usersbooks_params
    params.permit(:user_id, :book_id, :read_status, :id)
  end

end
