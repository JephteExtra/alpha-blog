class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all 
  end

  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article]
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was created successfully" # Where an error occurs use flash[:alert]
      # redirect_to article_path(@article)
      redirect_to @article
    else
      render 'new', status: :unprocessable_entity
    end
  end
end