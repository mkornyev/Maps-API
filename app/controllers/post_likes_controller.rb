class PostLikesController < ApplicationController
    swagger_controller :post_likes, "Post Likes"

    before_action :set_post_like, only: [:show, :update, :destroy]
  
    # GET /post_likes
    swagger_api :index do
      summary "Gets all Post likes"
    end
    def index
      @post_likes = PostLike.all
  
      render json: @post_likes
    end
  
    # GET /post_likes/1
    swagger_api :show do
      summary "Shows one Post like"
      param :path, :id, :integer, :required, "Post like ID"
      response :not_found
    end
    def show
      render json: @post_like
    end
  
    # POST /post_like
    swagger_api :create do
      summary "Creates a new Post like"
      param :form, :user, :integer, :required, "User id"
      param :form, :post, :integer, :required, "Post id"
      response :not_acceptable
    end
    def create
      @post_like = PostLike.new(post_like_params)
  
      if @post_like.save
        render json: @post_like, status: :created, location: @post_like
      else
        render json: @post_like.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /post_like/1
    def update
      if @post_like.update(post_like_params)
        render json: @post_like
      else
        render json: @post_like.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /post_like/1
    swagger_api :destroy do
      summary "Deletes a Post like"
      param :path, :id, :integer, :required, "Post like Id"
      response :not_found
    end
    def destroy
      @post_like.destroy
    end
  
    private
      def set_post_like
        @post_like = PostLike.find(params[:id])
      end
  
      def post_like_params 
      	# Permit all 
        params.permit(:user, :post)
      end
  end

