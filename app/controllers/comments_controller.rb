class CommentsController < ApplicationController
 
 def create
 @micropost  = Micropost.find(params[:micropost_id])
 @comment  = @micropost.comments.create(params[:comment])
 if @comment.save
  flash[:success] = "Done."
    redirect_to micropost_path(@micropost)
  else
    redirect_to micropost_path(@micropost)
  end
end
 
 def destroy
 end
end