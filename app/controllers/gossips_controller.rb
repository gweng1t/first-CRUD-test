class GossipsController < ApplicationController
	def index
		@user_tab = User.all
	  	@city_tab = City.all
	  	@gossip_tab = Gossip.all
	end


  def create
  	puts "-"*50
  	puts params
  	mon_gossip = Gossip.new(title: params[:title], content: params[:content], anonymous_gossiper: params[:author])
  	if mon_gossip.save
  		redirect_to "<%= gossip_path(mon_gossip.id) %>"
  	else
  		redirect_to gossip_path
  	end
  end

  def show
  	@id = params[:id]
  	@title = Gossip.find(@id).title
  	@content = Gossip.find(@id).content
  	@anonymous_author = Gossip.find(@id).anonymous_gossiper
  end

  def edit
  	@gossip = Gossip.find(params[:id])
  	puts @gossip.id
  end

  def update
  	@id = params[:id]
  	@gossip = Gossip.find(@id)

  	gossip_param = params.require(:gossip).permit(:title, :content, :anonymous_gossiper)
  	@gossip.update(gossip_param)
  	
	redirect_to gossip_path
  end

  def destroy
  	@id = params[:id]
  	@gossip = Gossip.find(@id)
  	@gossip.destroy
  	redirect_to root_path
  end

end
