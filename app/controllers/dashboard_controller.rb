class DashboardController < ApplicationController
  def index
    @notes = Note.all
  end
end
