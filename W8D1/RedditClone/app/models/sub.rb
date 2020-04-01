class Sub < ApplicationRecord
    validates :title, :description, :moderator_id, presence: true
    validates :title, uniqueness: true

    belongs_to :moderator,
    foreign_key: :moderator_id,
    class_name: :User

    def is_moderator?
        current_user.id == self.moderator_id
    end

end


# check if is_moderator is working, or implement the practice assessment logic into it