class ArticlesController < ApplicationController

  def index
    #binding.pry
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
  @article = Article.find(params[:id])
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end 
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
      #redirect_to new_article_path
    end
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments unless @article.comments.empty?
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
  
end

=begin
  <p>
    <%= form.label :title %><%=#@article.errors.messages[:title] if  @article.errors.messages[:title]%><br>
    <%= form.text_field :title %>
  </p>

  <p>
    <%= form.label :text %><%=#@article.errors.messages[:text] if  @article.errors.messages[:text]%><br>
    <%= form.text_area :text %>
  </p>
=end