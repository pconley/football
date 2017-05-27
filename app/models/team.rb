class Team < ApplicationRecord
    belongs_to :country
    has_many :memberships
    has_many :players, :through => :memberships
end
