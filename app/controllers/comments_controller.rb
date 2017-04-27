class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    Comment.find(params[:id]).destroy
    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
