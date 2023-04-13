require 'byebug'

class Artwork < ApplicationRecord
    validates :artist_id, uniqueness: {scope: :title, message: 'User cannot have two art works of the same title!'}

    has_many :artwork_shares,
        dependent: :destroy

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

    def self.artworks_for_user_id(user_id)
        
        # User.find(user_id).artworks, User.find(user_id).shared_artworks #DOESNT WORK
        [User.find(user_id).artworks, User.find(user_id).shared_artworks] #WORKS 
        return User.find(user_id).artworks, User.find(user_id).shared_artworks #WORKS
    end
end