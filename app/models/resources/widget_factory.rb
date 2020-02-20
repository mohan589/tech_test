class Resources::WidgetFactory < Resources::Factory
  def self.get(term)
    url = self.path + "/widgets/visible?" + "client_id=" + CLIENT_ID + "&client_secret=" + CLIENT_SECRET
    url = self.path + "/widgets/visible?" + "client_id=" + CLIENT_ID + "&client_secret=" + CLIENT_SECRET + "&term=" + term if term.present?

    result = RestClient.get(url, headers= {"Authorization" => self.token })
    self.handle_response(result)
  rescue KeyError => e
    raise_configuration_error(
      missing_env: "config error",
      error: e
    )
  end

  def self.access_token
    User&.current_token
  end

  def self.token
    self.access_token&.dig("token_type") + ' ' + self.access_token&.dig("access_token")
  end
end
