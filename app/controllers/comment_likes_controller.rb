class CommentLikesController < ApplicationController
  
    before_action :set_comment_like, only: [:show, :update, :destroy]
  
    # GET /comment_likes
    def index
      @comment_likes = CommentLike.all
  
      render json: @comment_likes
    end
  
    # GET /comment_likes/1
    def show
      render json: @comment_like
    end
  
    # POST /comment_like
    def create
      @comment_like = CommentLike.new(comment_like_params)
  
      if @comment_like.save
        render json: @comment_like, status: :created, location: @comment_like
      else
        render json: @comment_like.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /comment_like/1
    def update
      if @comment_like.update(comment_like_params)
        render json: @comment_like
      else
        render json: @comment_like.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /comment_like/1
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

