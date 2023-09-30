class Parcel < ApplicationRecord
  # NOTE: To add processed option for parcel status
	STATUS = ['Sent', 'In Transit', 'Delivered', 'Processed']
	PAYMENT_MODE = ['COD', 'Prepaid']

	validates :weight, :status, presence: true
	validates :status, inclusion: STATUS
	validates :payment_mode, inclusion: PAYMENT_MODE

	belongs_to :service_type
	belongs_to :sender, class_name: 'User'
	belongs_to :receiver, class_name: 'User'

	# NOTE: To send an email to sender/reciever for status change and at time of parcel create
	after_save :send_notification, if: Proc.new { is_status_changed? }

	private

	def send_notification
		UserMailer.with(parcel: self).status_email.deliver_later
	end

	def is_status_changed?
		self.saved_change_to_status?
	end
end
