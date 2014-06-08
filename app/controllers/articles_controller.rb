class ArticlesController < ApplicationController
  def index
  @article = Article.all
  end

  def new
  @article = Article.new 
  end

  def create
  	@article = Article.new(a_params)
   if @article.save
	#:notice => "Your article saved !"
   	redirect_to @article
   else
	   render "new"
   end
  end

  def show
  @article = Article.find(params[:id])
  end

  def edit
  @article = Article.find(params[:id])
  end

  def update
  @article = Article.find(params[:id])	
  if @article.update(a_params)
  redirect_to @article
  else
	  render "edit"
  end
  end
  def destroy
  	@article = Article.find(params[:id])
	@article.destroy
	redirect_to articles_path
  end
  private
  def a_params
  	params.require(:article).permit(:title , :text)
  end
end
