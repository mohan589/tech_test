class WidgetsController < ApplicationController
  def index
    @widgets = Widget.all
    puts @widgets.inspect
    @widgets
  end
end
