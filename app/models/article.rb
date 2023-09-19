class Article < ApplicationRecord
    has_rich_text :content

    belongs_to :user # Un articulo pertenece a un usuario

    has_many :has_categories
    has_many :categories, through: :has_categories
end
