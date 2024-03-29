require 'github/markup'

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @markup = GitHub::Markup.render('README.md', @post.body)
    Rails.logger.debug "markup is #{@markup}"
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_path
  end


private
  def post_params
      params.require(:post).permit(:title, :body)
    end
end
