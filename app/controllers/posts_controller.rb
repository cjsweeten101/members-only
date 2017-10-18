class PostsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create]

	def index
		@user = current_user
		@posts = Post.all
	end

	def new
		@user = current_user
		@post = Post.new
	end

	def create
		@user = current_user
		if @user.posts.create(text: params[:post][:text])
			flash.now[:success] = "Post created"
			redirect_to root_url
		else
			flash.now[:danger] = "Your post can't be empty or over 140 characters :("
			render 'new'
		end
	end

	def logged_in_user
		unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
    end
	end
end
