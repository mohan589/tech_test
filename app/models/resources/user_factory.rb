class Resources::UserFactory < Resources::Factory
  def self.post(url: nil, payload:, headers: nil)
    url = path + "/users" if url.nil?
    @payload = payload

    super(url: url, payload: input.to_json, headers: headers || HEADERS)
  end

  def self.revoke_user
    url = DOMAIN + "/oauth/revoke"
    headers= { "Authorization" => self.token }.merge!(HEADERS)

    self.post(url: url, payload: { token: self.access_token.dig("access_token") }, headers: headers)
  end
end
