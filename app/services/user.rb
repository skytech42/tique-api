require 'jwt'
require 'net/http'

class User
  def self.domain_url
    "https://#{Rails.configuration.auth0.domain}/"
  end
end
