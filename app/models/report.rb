class Report < ApplicationRecord
  # NOTE: Linked with file uploader to save reports
  mount_base64_uploader :report, ReportUploader
end
