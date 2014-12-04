class UsersController < ApplicationController
  
  def index
    @users=User.all
  end
  def new
    @user=User.new
  end
  def usermessages
    @user=User.find(params[:user_id])
	#@message=User.messages.new(message_params)
	#@messages=Message.all
	render "messages/show"
  end
  
  def search
    @originalUser=User.find(params[:id])
	@user=User.new(user_params)
	@s=[]
	@s=User.searchUser(@user)
  end
  def show
    @user=User.find(params[:id])
	@users=User.all
	@friendships=Friendship.all
	@f=User.get_friend_requests(@user)
	@m=User.get_friends(@user)
  end
 
  def create
    @user=User.new(user_params)
	
	if @user.save
	  redirect_to root_path
	else
	  render 'new'
	end
  end
  private
    def user_params
	  params.require(:user).permit(:name,:gender)
	end
	
end
