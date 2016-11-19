# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  slug       :string(255)      not null
#  order      :integer          default(0), not null
#  name_en    :string(255)      not null
#  name_ja    :string(255)      not null
#  image_url  :text(65535)      not null
#  desc_en    :text(65535)      not null
#  desc_ja    :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  validates :slug, uniqueness: true, format: {with: /[a-z0-9_-]{1,}/}
  validates :name_en, presence: true, allow_blank: false
  validates :name_ja, presence: true, allow_blank: false
  validates :image_url, presence: true, allow_blank: true
  validates :desc_en, presence: true, allow_blank: true
  validates :desc_ja, presence: true, allow_blank: true
  has_many :articles, dependent: :nullify

  default_value_for :image_url, ''
  default_value_for :desc_en, ''
  default_value_for :desc_ja, ''
end
