module User::Operation
  class Index < Trailblazer::Operation

    step :fetch_users
    fail :set_error_message, fail_fast: true

    def fetch_users(ctx, **)
      ctx[:users] = User.all
    end

    def set_error_message(ctx, **)
      ctx[:error] = 'Something went wrong'
    end

  end
end
