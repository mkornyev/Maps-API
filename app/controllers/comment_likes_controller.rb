class CommentLikesController < ApplicationController
    swagger_controller :comment_likes, "Comment Likes"

    before_action :set_comment_like, only: [:show, :update, :destroy]
  
    # GET /comment_likes
    swagger_api :index do
      summary "Gets all Likes"
    end
    def index
      @comment_likes = CommentLike.all
  
      render json: @comment_likes
    end
      
    # No endpoint needed*** 

    # GET /comment_likes/1
    # swagger_api :show do
    #   summary "Shows one Like"
    #   param :path, :user, :integer, :required, "User ID"
    #   param :path, :comment, :integer, :required, "Comment ID"

    #   notes "Lists all attributes for a user."
    #   response :not_found
    # end
    # def show
    #   render json: @comment_like
    # end
  
    # POST /comment_like
    swagger_api :create do
      summary "Creates a new Like"
      param :form, :user, :integer, :required, "User ID"
      param :form, :comment, :integer, :required, "Comment ID"
      response :not_acceptable
    end
    def create
      @comment_like = CommentLike.new(comment_like_params)
  
      if @comment_like.save
        render json: @comment_like, status: :created, location: @comment_like
      else
        render json: @comment_like.errors, status: :unprocessable_entity
      end
    end
  
    # No endpoint needed*** 

    # PATCH/PUT /comment_like/1
    # swagger_api :update do
    #   summary "Updates a CommentLike"
    #   param :form, :user, :string, :required, "User ID"
    #   param :form, :comment, :string, :required, "Comment ID"
    #   response :not_found
    #   response :not_acceptable
    # end
    # def update
    #   if @comment_like.update(comment_like_params)
    #     render json: @comment_like
    #   else
    #     render json: @comment_like.errors, status: :unprocessable_entity
    #   end
    # end
  
    # DELETE /comment_like/1
    swagger_api :destroy do
      summary "Deletes a Like"
      param :path, :user, :integer, :required, "User Id"
      param :path, :comment, :integer, :required, "Comment Id"
      response :not_found
    end
    def destroy
      @comment_like.destroy
    end
  
    private
      def set_comment_like
        @comment_like = CommentLike.find(params[:id])
      end
  
      def comment_like_params 
      	# Permit all 
        params.permit(:user, :comment_like)
      end
  end

