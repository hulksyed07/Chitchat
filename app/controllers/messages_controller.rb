class MessagesController < ApplicationController
  before_action :set_recipient, only: [:new, :create]

   def new
   
      @messages=Message.all
      @user=User.find(params[:user_id])
	  @message=@user.messages.new(message_params)
	  #@testmessage={}
	  #@testmessage["sender_id"]=@message.sender_id
	  #@testmessage["recipient_id"]=@message.recipient_id
      #@message = current_user.sent_messages.new
   end

   def create
      @user=User.find(params[:user_id])
	  @message=@user.sent_messages.new(message_params)
	  @users=User.all
	  
	  
	  @friend=User.find(@message.recipient_id)
	  		
	  #@message1=@friend.messages.new(message1_params)
	  #@message=@user.messages.create(message_params)
	  @message.save
	  #@message1.save
	  render "messages/search"
	  #redirect_to :back
      #@message = current_user.sent_messages.new message_params
      #@message.recipient_id = @recipient.id
      #@message.save
   end
   
   def search
      @user=User.find(params[:user_id])
	  @message=@user.sent_messages.new(search_message_params)
	  @friend=User.find(@message.recipient_id)
   end

   def index
      @messages = Message.all
   end

   def destroy
      @message = current_user.messages.destroy params[:id]
   end

   def show
      @messages=Message.all
      #@message = current_user.messages.find params[:id]
   end

   private
   
   def search_message_params
      params.require(:message).permit( :recipient_id, :sender_id)
   end

   def message_params
      params.require(:message).permit(:body, :recipient_id)
   end
   #def message1_params
   #   params.require(:message).permit(:body, :sender_id)
   #end

   def set_recipient
       @recipient = User.find params[:user_id]
   end
   def current_user
       @current_user=User.find(params[:id])
   end
   
end
