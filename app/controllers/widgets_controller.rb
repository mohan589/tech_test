class WidgetsController < ApplicationController
  def index
    @widgets = Widget.all(term)
    widgets
  end

  def create
    @widget = Widget.create_widget(widget_params)

    if @widget.present?
      redirect_to widgets_path
    else
      render 'new'
    end
  end

  def new
    @widget = Widget.new
  end

  def my_widgets
    @widgets = Widget.me
    widgets
    render 'index'
  end

  private
  def term
    params&.dig("search")&.dig("term")
  end

  def widgets
    @widgets = @widgets&.dig("widgets")
  end

  def widget_params
    params.require(:widget).permit(:name, :description, :kind)
  end
end
