class Article < ApplicationRecord
    has_rich_text :content

    belongs_to :user # Un articulo pertenece a un usuario
end
