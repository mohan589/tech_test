class Resources::WidgetFactory < Resources::Factory
  def self.get(term, me: false)
    url = self.path + "/widgets/visible?" + "client_id=" + CLIENT_ID + "&client_secret=" + CLIENT_SECRET
    url = self.path + "/widgets/visible?" + "client_id=" + CLIENT_ID + "&client_secret=" + CLIENT_SECRET + "&term=" + term if term.present?

    url = self.path + "/users/me/widgets?" + "client_id=" + CLIENT_ID + "&client_secret=" + CLIENT_SECRET unless me == false

    headers= {"Authorization" => self.token }.merge!(HEADERS)
    super(url: url, headers: headers)
  end

  def self.post(url: nil, payload:)
    url = path + "/widgets"
    headers= {"Authorization" => self.token }.merge!(HEADERS)
    super(url: url, payload: payload.to_json, headers: headers)
  end

  def self.me
    self.get(nil, me: true)
  end
end
