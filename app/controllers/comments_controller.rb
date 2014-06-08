class CommentsController < ApplicationController
def create
	@article = Article.find(params[:article_id])
	@comment = @article.comments.create(c_params)
	redirect_to article_path(@article)
end
def destroy
	@article = Article.find(params[:article_id])
	@comment = @article.comments.find(params[:id])
	@comment.destroy
	redirect_to article_path(@article)
end
private
def c_params
params.require(:comment).permit(:commenter, :body)
end
end
