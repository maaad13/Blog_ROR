class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  load_and_authorize_resource
  def index
    @articles = Article.all
  end

  def show
    @article= Article.find(params[:id])
  end

  def new 
    @article= Article.new
  end

  def create 
    if cannot? :create, Article
      redirect_to article_path, alert: "You are not authorized to create Article"
    end
    @article = current_user.articles.new(article_params) 
    if @article.save
      redirect_to @article, alert: "Article created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article= Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:tittle, :body, :status)
    end
end
