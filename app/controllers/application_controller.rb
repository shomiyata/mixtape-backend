class ApplicationController < ActionController::API

  def issue_token(payload)
    JWT.encode(payload, ENV['JWT_SECRET'])
  end

  def decoded_token(token)
    begin
      JWT.decode(token, ENV['JWT_SECRET'])
    rescue JWT::DecodeError
      []
    end
  end

  def token
    if bearer_token = request.headers["Authorization"]
      jwt_token = bearer_token.split(" ")[1]
    end
  end

  def current_user
    decoded_hash = decoded_token(token)
    if !decoded_hash.empty?
      puts "checking what the decoded hash looks like!", decoded_hash
      user_id = decoded_hash[0]["user_id"]
      user = User.find(user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to '/api/v1/login' unless logged_in?
  end
end
