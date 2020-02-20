class Widget
  def self.all
    @user = Resources::WidgetFactory.get
  end
end
