class Widget
  def self.all(term)
    @user = Resources::WidgetFactory.get(term)
  end

  def self.me
    @user = Resources::WidgetFactory.me
  end

  def self.create_widget(params)
    @widget = Resources::WidgetFactory.post(payload: { :widget => params })
  end

  attr_accessor :name, :description, :kind
end
# http://ab.com/a.png