class CourierReportGenerator
  include Sidekiq::Worker
  # NOTE: Create report with details of Courier + Sender + Receiver in xlsx format
  def perform
    parcels = Parcel.where('created_at > ?', 1.days.ago).includes(:sender, :receiver, :service_type)

    path = Rails.root.join('tmp').join("file-#{Time.now.strftime("%y-%m-%d").to_s}.xlsx")
    FileUtils.touch path
    workbook = RubyXL::Workbook.new
    worksheet = workbook[0]
    parcels_data = [[
      'Weight', 'type_of_service', 'cost_of_service', 'payment_mode', 'status', 'Sender Name',
      'Sender Email', 'Sender Details', 'Receiver Name', 'Receiver Email', 'Receiver Details'
    ]]
    parcels.each do |parcel|
      parcels_data << [
                        parcel.weight, parcel.service_type.name, parcel.cost.to_i,
                        parcel.payment_mode, parcel.status, parcel.sender.name, parcel.sender.email,
                        parcel.sender.name_with_address, parcel.receiver.name, parcel.receiver.email,
                        parcel.receiver.name_with_address
                      ] rescue []
    end
    parcels_data.each_with_index do |x, index|
      col = *(0..(x.size - 1))
      col.each do |i|
        worksheet.add_cell(index, i, "#{x[i]}")
      end
    end

    workbook.write(path)
    new_report  = Report.new
    new_report.report = File.open(path)
    new_report.save
  end
end
