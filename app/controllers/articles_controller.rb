class ArticlesController < ApplicationController
  
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    @articles = Article.all.order('created_at DESC')
  end
  
  def show
  end
  
  def new
    @article = current_user.articles.build
  end
  
  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @article.update
      redirect_to articles_path
    else
      render 'edit'
  end
end

  def destroy
    @article.destroy
    redirect_to articles_path
  end
  
  private 
  
  def article_params
    params.require(:article).permit(:title, :body)
  end
    def find_article
      @article = Article.find(params[:id])
    end
end
