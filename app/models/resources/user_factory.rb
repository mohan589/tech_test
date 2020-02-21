class Resources::UserFactory < Resources::Factory
  def self.post(url: nil, payload:)
    url = path + "/users" if url.nil?
    @payload = payload

    begin
      result = RestClient.post(url, input.to_json, headers= HEADERS)
      self.handle_response(result)
    rescue RestClient::Unauthorized, RestClient::Forbidden => err
      return err.response
    rescue RestClient::ImATeapot => err
      return err.response
    rescue KeyError => e
      raise_configuration_error(
        missing_env: "config error",
        error: e
      )
    end
  end
end
