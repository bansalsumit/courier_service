class Address < ApplicationRecord
	validates :address_line_one, :city, :state, :country, presence: true

	belongs_to :user
end
