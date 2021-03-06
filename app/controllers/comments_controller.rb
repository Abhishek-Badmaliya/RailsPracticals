class CommentsController < ApplicationController
  #create comment method
  def create
    @event = Event.find(params[:event_id]).comments.create("content"=>params[:content],"usser_id"=>current_user.id)
    @current_event = Event.find(params[:event_id])
    redirect_to event_path(@current_event)
  end

  #add like method
  def like
    @comment = Comment.find_by(id: params[:comment_id].to_i)
    @comment.likes = @comment.likes.to_i + 1
    @comment.update(likes: @comment.likes)
    @current_event = Event.find(params[:event_id])
    redirect_to event_path(@current_event)
  end
end
