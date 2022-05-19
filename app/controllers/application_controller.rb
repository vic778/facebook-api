class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, 'secret')
  end

  def decode_token
    auth_header = request.headers['Authorization']
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, 'secret')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def authozied_user
    decode_token = decode_token()
    if decode_token
      user_id = decode_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def authorized
    render json: { error: 'Please log in' }, status: :unauthorized unless authozied_user
  end
end
