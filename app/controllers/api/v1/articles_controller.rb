class Api::V1::ArticlesController < ApplicationController
  #add callback
  before_action :set_article, only: [:edit, :update, :show, :destory]

  def index
    @articles = Article.all
    render json: @articles
  end

  def show
    render json: @article
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def edit
    render json: @article
  end

  def destroy
    @article = Article.find_by(params[:id])
    @article.destroy
    render json: "Article Successfully Deleted!!"
  end

  #define search method
  def article_search
    @parameter = params[:title]
    @article = Article.where("lower(title) LIKE :title", title: "%#{@parameter}%")
    if @article != []
      render json: @article
    else
      render json: "Record's has been not found!"
    end
  end

  private

  def set_article
    @article = Article.find_by(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :release_date)
  end
end
