class Article < ApplicationRecord
    has_rich_text :content

    belongs_to :user # Un articulo pertenece a un usuario

    has_many :has_categories
    has_many :categories, through: :has_categories

    attr_accessor :category_elements

    def save_categories
        return has_categories.destroy_all if category_elements.nil? || category_elements.empty? # Si en el formulario no se selecciona ninguna categoria

        has_categories.where.not(category_id: category_elements).destroy_all

        category_elements.each do |category_id|
            HasCategory.find_or_create_by(article: self, category_id: category_id) # self hace referencia al articulo actual
        end
    end
end
