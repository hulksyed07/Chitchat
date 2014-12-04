class FriendshipsController < ApplicationController
  def new
    friendship=Friendship.new
  end
  def create
    @friendship=Friendship.new(friendship_params)
	if @friendship.save
	  redirect_to user_path(@friendship.user_id) 
	end
  end
  def update
    @friendship=Friendship.find(params[:id])
	if @friendship.update(friendship_params)
	  redirect_to user_path(@friendship.friend_id)
	end
  end
   def destroy
    @friendship=Friendship.find(params[:id])
	@temp=@friendship.friend_id
	@friendship.destroy
	#redirect_to root_path
	#redirect_to user_path(@temp)
	redirect_to :back
	
  end
  
  private 
    def friendship_params
	  params.require(:friendship).permit(:user_id,:friend_id,:status)
	end
end
