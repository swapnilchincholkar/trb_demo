module User::Operation
  class Show < Trailblazer::Operation

    step :is_request_valid
    fail :invalid_params, fail_fast: true
    step :fetch_user
    fail :invalid_user_id

    def is_request_valid(ctx, params: ,**)
      params.has_key?(:user_id)
    end

    def fetch_user(ctx, params:, **)
      ctx[:user] = User.where(id: params[:user_id]).first
    end

    def invalid_params(ctx, **)
      ctx[:error] = 'User id not recevied in request'
    end

    def invalid_user_id(ctx, **)
      ctx[:error] = "User not found with ID #{params[:user_id]}"
    end

  end
end
