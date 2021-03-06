class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      redirect_to @post, flash: { error: "Can't add empty comment!" }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end
