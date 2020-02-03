class ArticlesController < ApplicationController

  def index
    #binding.pry
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    
  end

  def create
    @article = Article.new(article_params)
    binding.pry
    if @article.save
      redirect_to @article
    else
      render 'new'
      #redirect_to new_article_path
    end
  end

  def show
    #binding.pry
    @article = Article.find(params[:id])
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