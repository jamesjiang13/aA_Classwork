class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    validates :title, uniqueness: {scope: :artist_id}

    belongs_to :user,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

    has_many :comments, dependent: :destroy

end
