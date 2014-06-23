class CommentsController < ApplicationController
 def index
 end 

 def show
  @comment = Comment.find(params[:id])
 end

def create
  params_with_user_id = comment_params.merge(
    user_id: current_user.id
  )

  @comment = Comment.new(params_with_user_id)
  if @comment.save
    redirect_to root_to
  else
    render :new
  end
end

 private

 def comment_params
   params.require(:comment).permit(
     :body, 
     :image_id
   )
 end
end