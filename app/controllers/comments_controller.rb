class CommentsController < ApplicationController
   before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
   @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = 'comment created successfully'
      redirect_to comments_path
    else
      flash.now[:alert] = 'comment create failed'
      render :new, status: :unprocessable_entity
    end
  end

 def show; end

 def edit; end

  def update
   if @comment.update(comment_params)
      flash[:notice] = 'comment updated successfully'
      redirect_to comments_path
    else
      flash.now[:alert] = 'comment update failed'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = 'comment destroyed successfully'
    redirect_to comments_path
  end

 private

 def set_comment
   @comment = Comment.find(params[:id])
 end

 def comment_params
   params.require(:comment).permit(:body)
 end
end
