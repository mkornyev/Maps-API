class CommentsController < ApplicationController
    swagger_controller :comments, "Comments"

    before_action :set_comment, only: [:show, :update, :destroy]
    
    # GET /comments
    swagger_api :index do
      summary "Gets all Comments"
    end
    def index
      @comments = Comment.all
  
      render json: @comments
    end
  
    # GET /comments/1
    swagger_api :show do
      summary "Shows one Comment"
      param :path, :id, :integer, :required, "Comment ID"
      response :not_found
    end
    def show
      render json: @comment
    end
  
    # POST /comment
    swagger_api :create do
      summary "Creates a new Comment"
      param :form, :user, :integer, :required, "User ID"
      param :form, :post, :integer, :required, "Post ID"
      param :form, :likes_count, :integer, :required, "Likes Count"
      param :form, :comment, :string, :required, "Comment"
      response :not_acceptable
    end
    def create
      @comment = Comment.new(comment_params)
  
      if @comment.save
        render json: @comment, status: :created, location: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /comment/1
    swagger_api :update do
      summary "Updates a Comment"
      param :form, :id, :integer, :required, "Comment ID"
      param :form, :likes_count, :integer, :optional, "Likes Count"
      param :form, :comment, :string, :optional, "Comment"
      response :not_found
      response :not_acceptable
    end
    def update
      if @comment.update(comment_params)
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /comment/1
    swagger_api :destroy do
      summary "Deletes a Comment"
      param :path, :id, :integer, :required, "Comment Id"
      response :not_found
    end
    def destroy
      @comment.destroy
    end
  
    private
      def set_comment
        @comment = Comment.find(params[:id])
      end
  
      def comment_params 
      	# Permit all 
        params.permit(:user, :post, :likes_count, :comment)
      end
  end

