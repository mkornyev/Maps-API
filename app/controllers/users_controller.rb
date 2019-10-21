class UsersController < ApplicationController
    
    swagger_controller :users, "Users"

    before_action :set_user, only: [:show, :update, :destroy]
  
    # GET /users
    swagger_api :index do
      summary "Gets all Users"
    end
    def index
      @users = User.all
  
      render json: @users
    end
  
    # GET /users/1
    swagger_api :show do
      summary "Shows one User"
      param :path, :id, :integer, :required, "User ID"
      notes "Lists all attributes for a user."
      response :not_found
    end
    def show
      render json: @user
    end
  
    # POST /user
    swagger_api :create do
      summary "Creates a new User"
      param :form, :fname, :string, :required, "First name"
      param :form, :lname, :string, :required, "Last name"
      param :form, :email, :string, :required, "Email address"
      response :not_acceptable
    end
    def create
      @user = User.new(user_params)
  
      if @user.save
        render json: @user, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /user/1
    swagger_api :update do
      summary "Updates a User"
      param :path, :id, :integer, :required, "User Id"
      param :form, :fname, :string, :optional, "First Name"
      param :form, :lname, :string, :optional, "Last Name"
      param :form, :email, :string, :optional, "Email Address"
      param :form, :profile_image_url, :string, :optional, "Profile Image Url"
      param :form, :bio, :string, :optional, "Profile Bio"
      param :form, :friends_count, :string, :optional, "Friends count"
      param :form, :miles_travelled, :string, :optional, "Miles travelled count"
      response :not_found
      response :not_acceptable
      # notes "fields marked with a * are updated with api callbacks"
    end
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /user/1
    swagger_api :destroy do
      summary "Deletes a User"
      param :path, :id, :integer, :required, "User Id"
      response :not_found
    end
    def destroy
      @user.destroy
    end
  
    private
      def set_user
        @user = User.find(params[:id])
      end
  
      def user_params 
      	# Permit all 
        params.permit(:fname, :lname, :email, :profile_image_url, :bio, :friends_count, :miles_travelled)
      end
  end
