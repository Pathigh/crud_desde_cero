class PostsController < ApplicationController
	def index
		@posts = Post.all
		
	end

	def new
		@post = Post.new
	end
		
	def create
		post = Post.new(post_params)
		
		if post.save
		redirect_to post, notice:'Se creo un Post'
		else
			redirect_to posts_new_path notice: 'cagaste'
		end

	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
		
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)

		 	redirect_to @post, notice:'se modifico exitosamente'
		 else
		 	redirect_to edit_post_path, notice: 'No se a podido actualizar'
		end 

	end

	def destroy
		@post = Post.find(params[:id])

		 @post.destroy
		 redirect_to root_path, notice:'se ha borrado exitosamente'
	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end
end
