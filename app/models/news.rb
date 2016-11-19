# == Schema Information
#
# Table name: news
#
#  id         :integer          not null, primary key
#  url        :text(65535)      not null
#  message_en :text(65535)      not null
#  message_ja :text(65535)      not null
#  date       :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class News < ApplicationRecord
  validates :url, presence: true, allow_blank: true
  validates :message_en, presence: true, allow_blank: false
  validates :message_ja, presence: true, allow_blank: false
  validates :date, presence: true, allow_blank: true

  default_value_for :url, ''
  default_value_for :date do Time.now end
end
