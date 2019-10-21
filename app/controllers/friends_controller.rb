class FriendsController < ApplicationController
  
    before_action :set_friend, only: [:show, :update, :destroy]
  
    # GET /friends
    def index
      @friends = Friend.all
  
      render json: @friends
    end
  
    # GET /friends/1
    def show
      render json: @friend
    end
  
    # POST /friend
    def create
      @friend = Friend.new(friend_params)
  
      if @friend.save
        render json: @friend, status: :created, location: @friend
      else
        render json: @friend.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /friend/1
    def update
      if @friend.update(friend_params)
        render json: @friend
      else
        render json: @friend.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /friend/1
    def destroy
      @friend.destroy
    end
  
    private
      def set_friend
        @friend = Friend.find(params[:id])
      end
  
      def friend_params 
      	# Permit all 
        params.permit(:user1, :user2, :are_friends)
      end
  end
