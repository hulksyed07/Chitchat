class User < ActiveRecord::Base
    has_many :messages, class_name: 'Message', :foreign_key => "recipient_id"
	has_many :sent_messages, class_name: 'Message', :foreign_key => "sender_id"
    def self.searchUser(temp)
      @q=[]
	  @users=User.all
      @users.each do |user|
        if user.name.downcase.include? temp.name.downcase
          @q<< user
        end
      end  
      return @q	
    end
	
	def self.get_friend_requests(temp)
	   @f=[]
	   @friendships=Friendship.all
       @friendships.each do |friendship|
         if friendship.user_id==temp.id && friendship.status==0
           @f<<friendship
         end
       end
       return @f	   
	end
	
	def self.get_friends(temp)
	  @m=[]
      @users=User.all
	  @friendships=Friendship.all
	  @friendships.each do |friendship|
	     @t={}
         if friendship.friend_id==temp.id && friendship.status==1
			@users.each do |user|
			  if user.id==friendship.user_id
			     @t["name"]=user.name
				 @t["friend_id"]=user.id
			  end
			end
			@t["id"]=friendship.id
			@m<<@t
         elsif friendship.user_id==temp.id && friendship.status==1
			@users.each do |user|
			  if user.id==friendship.friend_id
			     @t["name"]=user.name
				 @t["friend_id"]=user.id
			  end
			end
			@t["id"]=friendship.id
			@m<<@t
         end
      end
	  return @m	
	end
	
	#def self.get_friends(temp)
	#  @t={}
	#  @t["name"]=[]
	#  @t["id"]=[]
	#  @users=User.all
	 # @friendships=Friendship.all
	 # @friendships.each do |friendship|
     #    if friendship.friend_id==temp.id && friendship.status==1
	#		@users.each do |user|
	#		  if user.id==friendship.user_id
	#		     @t["name"]<<user.name
	#		  end
	#		end
	#		@t["id"]<<friendship.id
     #    elsif friendship.user_id==temp.id && friendship.status==1
	#		@users.each do |user|
	#		  if user.id==friendship.friend_id
	#		     @t["name"]<<user.name
	#		  end
	#		end
	#		@t["id"]<<friendship.id
     #    end
     # end
	 # return @t	
	# end
end
