class PostsController < ApplicationController
    swagger_controller :Posts, "Posts"

    before_action :set_post, only: [:show, :update, :destroy]
  
    # GET /posts
    swagger_api :index do
      summary "Gets all Posts"
    end
    def index
      @posts = Post.all
  
      render json: @posts
    end
  
    # GET /posts/1
    swagger_api :show do
      summary "Shows one Post"
      param :path, :id, :integer, :required, "Post ID"
      response :not_found
    end
    def show
      render json: @post
    end
  
    # POST /post
    swagger_api :create do
      summary "Creates a new Post"
      param :form, :trip, :integer, :required, "Trip ID"
      param :form, :tagline, :string, :required, "Post Caption"
      param :form, :like_count, :integer, :required, "Like count*"
      param :form, :comments_count, :integer, :required, "Comment count*"
      param :form, :date, :date, :required, "Post date"
      response :not_acceptable
      notes "fields marked with a * are updated with a callback on upades to like/comment tables"
    end
    def create
      @post = Post.new(post_params)
  
      if @post.save
        render json: @post, status: :created, location: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /post/1
    swagger_api :update do
      summary "Updates a Post"
      param :path, :id, :integer, :required, "Post Id"
      param :form, :trip, :integer, :optional, "Trip ID"
      param :form, :tagline, :string, :optional, "Post Caption"
      param :form, :like_count, :integer, :optional, "Like count*"
      param :form, :comments_count, :integer, :optional, "Comment count*"
      param :form, :date, :date, :optional, "Post date"
      response :not_found
      response :not_acceptable
      notes "fields marked with a * are updated with a callback on upades to like/comment tables"
    end
    def update
      if @post.update(post_params)
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /post/1
    swagger_api :destroy do
      summary "Deletes a Post"
      param :path, :id, :integer, :required, "Post Id"
      response :not_found
    end
    def destroy
      @post.destroy
    end
  
    private
      def set_post
        @post = Post.find(params[:id])
      end
  
      def post_params 
      	# Permit all 
        params.permit(:trip, :tagline, :like_count, :comments_count, :date)
      end
  end

