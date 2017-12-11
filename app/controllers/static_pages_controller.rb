class StaticPagesController < ApplicationController
  def home
    require_signed_in!
    @user = User.new
  end

  def about; end

  def map; end
end
