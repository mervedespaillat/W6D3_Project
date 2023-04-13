class Artwork < ApplicationRecord
    validates :artist_id, unique: {scope: :title, message: 'User cannot have two art works of the same title!'}
end