class Resources::UserFactory < Resources::Factory
  def self.post(url: nil, payload:)
    url = path + "/users" if url.nil?
    @payload = payload

    result = RestClient.post(url, input.to_json, headers= HEADERS)
    self.handle_response(result)
  rescue KeyError => e
    raise_configuration_error(
      missing_env: "config error",
      error: e
    )
  end
end
