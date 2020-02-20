class WidgetsController < ApplicationController
  def index
    @widgets = Widget.all(term)
    puts @widgets
    @widgets = @widgets&.dig("widgets")
  end

  private
  def term
    params&.dig("search")&.dig("term")
  end
end
