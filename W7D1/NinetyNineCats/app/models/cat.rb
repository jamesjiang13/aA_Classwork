require 'Date'

class Cat < ApplicationRecord
    COLORS = ["red", "orange", "black", "blue", "calico"]

    validates :birth_date, :color, :name, :sex, presence: true
    validates :sex, inclusion: { in: %w(M F) }
    validates :color, inclusion: { in: COLORS }

    def age
        "#{(Date.today - birth_date).to_i / 365} years" 
    end
end
