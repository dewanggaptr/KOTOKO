require 'jwt'
require 'dotenv'

module JsonWebToken
  SECRET_KEY = ENV['SECRET_KEY']

  def self.AuthorizeApiRequest(headers = {})
    if headers['Authorization'].present?
      token = headers['Authorization'].split(' ').last
      decode_auth_token = JsonWebToken.decode(token)
      if decode_auth_token
        cashier = Cashier.find(decode_auth_token[:cashier_id])
        return cashier if cashier
      end
    end
    nil
  end

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    body = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new body
  rescue StandardError
    nil
  end
end
