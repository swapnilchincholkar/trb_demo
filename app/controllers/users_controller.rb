class UsersController < ApplicationController

  def index
    result = User::Operation.Index.()
    if result.success?
      render json: result[:users].as_json
    else
      render json: {error: result[:error]}, status: 500
    end
  end

  def show
    result = User::Operation::Show.call(params)
    if result.success?
      render json: result[:user].as_json
    else
      render json: {error: result[:error]}, status: 400
    end
  end
end
