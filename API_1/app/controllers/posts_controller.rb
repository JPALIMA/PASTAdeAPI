class PostController < ApplicationController
     def index
          posts = Post.all
          render json: posts
     end

     def show
          post = Post.find(params[:id])
          render json: post
     end

     def create
          post = Post.new(post_params)
          if post.save
               render json: post, status: :created
          else
               render json: post.errors, status: :unprocessable_entity
          end
     end

     #Outras ações (update, delete) podem ser adicionadas aqui

     private

     def post_params
          params.require(:post).permit(:title, :content)
     end
end

