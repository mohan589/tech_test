class Resources::WidgetFactory < Resources::Factory
  def self.get(term)
    url = self.path + "/widgets/visible?" + "client_id=" + CLIENT_ID + "&client_secret=" + CLIENT_SECRET
    url = self.path + "/widgets/visible?" + "client_id=" + CLIENT_ID + "&client_secret=" + CLIENT_SECRET + "&term=" + term if term.present?

    result = RestClient.get(url, headers= {"Authorization" => self.token }.merge!(HEADERS))
    self.handle_response(result)
  rescue KeyError => e
    raise_configuration_error(
      missing_env: "config error",
      error: e
    )
  end

  def self.post(url: nil, payload:)
    url = path + "/widgets"
    @payload = payload

    result = RestClient.post(url, payload.to_json, headers= {"Authorization" => self.token }.merge!(HEADERS))
    self.handle_response(result)
  rescue KeyError => e
    raise_configuration_error(
      missing_env: "config error",
      error: e
    )
  end

  def self.me
    url = self.path + "/users/me/widgets?" + "client_id=" + CLIENT_ID + "&client_secret=" + CLIENT_SECRET
    begin
      result = RestClient.get(url, headers= {"Authorization" => self.token })
    rescue RestClient::ExceptionWithResponse => err
      case err.http_code
      when 301, 302, 307
        err.response.follow_redirection
      else
        raise err
      end
    rescue RestClient::Unauthorized, RestClient::Forbidden => err
      return err.response
    rescue RestClient::ImATeapot => err
      return err.response
    else
      self.handle_response(result)
    end
  end
end
