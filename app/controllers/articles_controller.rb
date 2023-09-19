class ArticlesController < ApplicationController
    before_action :find_article, only: [:show, :edit, :update, :destroy] # Tambien se puede hacer a la inversa -> except: [:new, :create]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end

    def show
    end

    def edit
    end

    def update
        @article.update(article_params) # Metodo article_params definidio mas abajo
        redirect_to @article
    end

    def new    
        @article = Article.new   
    end

    def create
        @article = current_user.articles.create(article_params) # Guardamos el usuario que escribio el articulo
        redirect_to @article
    end

    def destroy
        @article.destroy
        redirect_to root_path
    end

    def from_author
        @user = User.find(params[:user_id]) # Solo necesitamos el usuario, ya que podemos acceder a sus articulos desde la vista con @user.articles
    end

    def find_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :content)
    end
end
