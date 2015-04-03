class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comments_params)
    user = User.find(@post.user_id)
    if @comment.save
      message = Message.new(to: user.phone, from: "5038365278" , body: "Your post received a comment!")
      message.save
        # if message.save
        #   flash[:notice] = "Post user has been notified"
        # end

      respond_to do |format|
        format.html { redirect_to post_path(@post) }
          flash[:notice] = "Comment added"
        format.js
      end

    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comments_params)
      flash[:notice] = "Comment updated"
      redirect_to posts_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment deleted"
    redirect_to posts_path(@comment.post)
  end

private
  def comments_params
    params.require(:comment).permit(:text)
  end
end
