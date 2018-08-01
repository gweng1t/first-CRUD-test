class StaticsPagesController < ApplicationController
  def home
  	@user_tab = User.all
  	@city_tab = City.all
  	@gossip_tab = Gossip.all
  end
end
