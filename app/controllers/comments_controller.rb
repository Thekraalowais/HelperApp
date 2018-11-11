class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @service = Service.find(params[:service_id])
    # we use new to make some changes (which is user id will changes each time when user comment) before create the comment
    @comment = @service.comments.new(comment_params)
    # raise "dcdv"
    # >> >>  @comment.user_id
# => nil
# >>  @comment.service_id
# => 19
# we need to get user id then pass it to the comment instance variable otherwise it will return nil
    @comment.user_id = current_user.id
    @comment.save
    redirect_to service_path(@service)
  end

  # def destroy
  #   @service = Service.find(params[:service_id])
  #   @comment = @service.comments.find(params[:id])
  #   @comment.destroy
  #   redirect_to service_path(@service)
  # end

  private

  def comment_params
    params.require(:comment).permit(:body, :service_id, :user_id)
  end
end
