class FavoriteMusic < ApplicationRecord
	belongs_to :user
	attachment :image
end
