class ServiceType < ApplicationRecord
    validates :name, presence: true

	has_many :parcels
end
