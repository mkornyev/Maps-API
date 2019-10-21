class CommentsController < ApplicationController
  
    before_action :set_comment, only: [:show, :update, :destroy]
  
    # GET /comments
    def index
      @comments = Comment.all
  
      render json: @comments
    end
  
    # GET /comments/1
    def show
      render json: @comment
    end
  
    # POST /comment
    def create
      @comment = Comment.new(comment_params)
  
      if @comment.save
        render json: @comment, status: :created, location: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /comment/1
    def update
      if @comment.update(comment_params)
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /comment/1
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
