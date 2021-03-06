class Api::V1::ArcommentsController < ApplicationController
  #add callback
  before_action :set_arcomment, only: [:edit, :update, :show, :destory]

  def index
    @arcomments = Arcomment.all
    render json: @arcomments
  end

  def show
    render json: @arcomment
  end

  def create
    @arcomment = Arcomment.new(arcomment_params)
    if @arcomment.save
      render json: @arcomment, status: :created
    else
      render json: @arcomment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @arcomment.update(arcomment_params)
      render json: @arcomment
    else
      render json: @arcomment.errors, status: :unprocessable_entity
    end
  end

  def edit
    render json: @arcomment
  end

  def destroy
    @arcomment = Arcomment.find_by(params[:id])
    @arcomment.destroy
    render json: "Arcomment Successfully Deleted!!"
  end

  #define search method for comment
  def arcomment_search
    @parameter = params[:comment_content]
    @comment = Arcomment.where("lower(comment_content) LIKE :comment_content", comment_content: "%#{@parameter}%")
    if @comment != [] 
      render json: @comment
    else
      render json: "Record has been not found!"
    end
  end

  private

  def set_arcomment
    @arcomment = Arcomment.find_by(params[:id])
  end

  def arcomment_params
    params.require(:arcomment).permit(:comment_content, :date_of_comment, :article_id)
  end
end
