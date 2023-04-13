class ArtworkShare < ApplicationRecord
	validates :viewer_id, uniqueness: { scope: :artwork_id }

	belongs_to :artwork
	# belongs_to :artwork,
	# 	foreign_key: :artwork_id,
	# 	class_name: :Artwork,
	# 	primary_key: :id

	belongs_to :viewer,
		foreign_key: :viewer_id,
		class_name: :User
end