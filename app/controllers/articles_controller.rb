class ArticlesController < ApplicationController

  def index
    @articles = Article.order(created_at: :desc)

    render json: @articles
  end

  def show
    @article = Article.find(params[:id])

    render json: @article
  end

  def create
    @article = Article.new strong_params

    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update strong_params
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    head :ok
  end

  private

  def strong_params
    params.require(:article).permit(:title, :url, :imageUrl, :newsSite, :summary, :publishedAt)
  end

end
