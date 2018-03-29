class PostsController < ApplicationController
	protect_from_forgery with: :exception


	def index		
		@posts = Post.all.order('created_at DESC')
	end

	def show
        authorize! :read, @post, :alert => "Please log in to access this page"

		@post = Post.find(params[:id])
		@posts = Post.order("created_at DESC").limit(4).offset(1)		
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end

end
