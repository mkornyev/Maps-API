class FriendsController < ApplicationController
    swagger_controller :friends, "Friendships"

    before_action :set_friend, only: [:show, :update, :destroy]
  
    # GET /friends
    swagger_api :index do
      summary "Gets all Friendships"
    end
    def index
      @friends = Friend.all
  
      render json: @friends
    end
  
    # GET /friends/1
    swagger_api :show do
      summary "Shows one Friendship"
      param :path, :user1, :integer, :required, "Friend #1 ID"
      param :path, :user2, :integer, :required, "Friend #2 ID"
      param :path, :are_friends, :boolean, :optional, "Are friends?"
      response :not_found
    end
    def show
      render json: @friend
    end
  
    # POST /friend
    swagger_api :create do
      summary "Creates a new Friendship"
      param :path, :user1, :integer, :required, "Friend #1 ID"
      param :path, :user2, :integer, :required, "Friend #2 ID"
      param :path, :are_friends, :boolean, :required, "Are friends?"
      response :not_acceptable
    end
    def create
      @friend = Friend.new(friend_params)
  
      if @friend.save
        render json: @friend, status: :created, location: @friend
      else
        render json: @friend.errors, status: :unprocessable_entity
      end
    end
    
    # *** Endpoint not needed ***
    # PATCH/PUT /friend/1
    # swagger_api :update do
    #   summary "Updates a Friendship"
    #   param :path, :user1, :integer, :required, "Friend #1 ID"
    #   param :path, :user2, :integer, :required, "Friend #2 ID"
    #   param :path, :are_friends, :boolean, :optional, "Are friends?"
    #   response :not_found
    #   response :not_acceptable
    # end
    # def update
    #   if @friend.update(friend_params)
    #     render json: @friend
    #   else
    #     render json: @friend.errors, status: :unprocessable_entity
    #   end
    # end
  
    # DELETE /friend/1
    swagger_api :destroy do
      summary "Deletes a Friendship"
      param :path, :user1, :integer, :required, "Friend #1 ID"
      param :path, :user2, :integer, :required, "Friend #2 ID"
      response :not_found
    end
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
