require 'rest-client'

class Resources::Factory
  DOMAIN = "https://showoff-rails-react-production.herokuapp.com/".freeze
  HEADERS = { "Content-Type" => "application/json" }
  VERSION = "api/v1".freeze

  CLIENT_ID = "277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe".freeze
  CLIENT_SECRET = "d6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352".freeze

  def self.get(url:)
    result = RestClient.get(url, headers= {"Authorization" => self.token })
    self.handle_response(result)
  end

  def self.post(url: nil, payload:)
    @payload = payload
    result = RestClient.post(url, self.input.to_json, headers= HEADERS)
    result
  rescue KeyError => e
    raise_configuration_error(
      missing_env: "config error",
      error: e
    )
  end

  def self.path
    DOMAIN.dup + VERSION.dup
  end

  def self.input
    @payload.merge!({
      client_id: CLIENT_ID,
      client_secret: CLIENT_SECRET
    })
  end

  def self.raise_configuration_error(missing_env:, error:)
    recourse = "Please ensure the following ENV var(s) are set: #{Array(missing_env).join(" ")}"
    raise error
  end

  def self.handle_response(res)
    JSON.parse(res).dig("data")
  end

  def self.access_token
    User&.current_token
  end

  def self.token
    self.access_token&.dig("token_type") + ' ' + self.access_token&.dig("access_token") unless self.access_token.nil?
  end
end
