class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	# NOTE: Added authentication for User(Admin/Normal)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	# NOTE: To handle signup adding default data to it
	before_validation :add_default_data, on: :create
	validates :name, presence: true

	has_one :address
	has_many :send_parcels, foreign_key: :sender_id, class_name: 'Parcel'
	has_many :received_parcels, foreign_key: :receiver_id, class_name: 'Parcel'

	accepts_nested_attributes_for :address


	def name_with_address
		@name_with_address ||= [name, address.mobile_number, address.address_line_one, address.city, address.state, address.country, address.pincode].join('-')
	end

	def add_default_data
		if self.address.nil?
			self.address = Address.new
			self.name = self.email.gsub(/@.*/,'')
			self.address.address_line_one = '1st line'
			self.address.address_line_two = '2nd line'
			self.address.city = 'main city'
			self.address.state = 'State'
			self.address.country = 'India'
			self.address.pincode = '00887766'
			self.address.mobile_number = '9966775544'
		end
	end
end
