class PagesController < ApplicationController
  layout false
  def home
    render Views::Pages::Home.new
  end

  def modals
    render Views::Pages::Modals.new
  end

  def cards
    render Views::Pages::Cards.new
  end
end
