class ArticlesController < ApplicationController
    before_action :find_article, only: [:show, :edit, :update, :destroy] # Tambien se puede hacer a la inversa -> except: [:new, :create]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :authorize_user, only: [:edit, :update]

    def index
        @articles = Article.all
    end

    def show
    end

    def edit
        @categories = Category.all
    end

    def update
        @article.update(article_params) # Metodo article_params definidio mas abajo
        @article.save_categories
        
        redirect_to @article
    end

    def new    
        @article = Article.new   
        @categories = Category.all
    end

    def create
        @article = current_user.articles.create(article_params) # Guardamos el usuario que escribio el articulo
        @article.save_categories

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
        params.require(:article).permit(:title, :content, category_elements: [])
    end

    def authorize_user
        unless @article.user == current_user
          flash[:alert] = "No tienes permiso para editar este artículo."
          redirect_to articles_path
        end
      end
end
