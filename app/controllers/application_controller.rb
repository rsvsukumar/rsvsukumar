require "application_responder"
require 'date'
class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  before_action :most_recent_4months_album
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def most_recent_4months_album
    @recent_albums ||= Album.where("released_on >= ? AND released_on <= ?" , Date.today - 4.months, Date.today + 4.months)
  end

end
