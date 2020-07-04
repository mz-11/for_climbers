class PagesController < ApplicationController
  skip_before_action :login_required

  def index
  end

  def about
  end
end
