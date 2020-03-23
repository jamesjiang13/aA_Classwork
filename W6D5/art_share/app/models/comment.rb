class Comment < ApplicationRecord
    validates :artwork_id, presence: true
    validates :user_id, presence: true

    belongs_to :user

    belongs_to :artwork

end
