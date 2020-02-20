class Widget
  def self.all(term)
    @user = Resources::WidgetFactory.get(term)
  end
end
