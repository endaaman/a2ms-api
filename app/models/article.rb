# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  slug        :string(255)      not null
#  draft       :boolean          default(FALSE), not null
#  order       :integer          default(0), not null
#  title_en    :string(255)      not null
#  title_ja    :string(255)      not null
#  image_url   :text(65535)      not null
#  content_en  :text(65535)      not null
#  content_ja  :text(65535)      not null
#  comment     :text(65535)      not null
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_articles_on_category_id  (category_id)
#  index_articles_on_slug         (slug) UNIQUE
#

class Article < ApplicationRecord
  validates :slug, presence: true, uniqueness: true, format: {with: /[a-z0-9_-]{1,}/}
  validates :draft, inclusion: {in: [true, false]}
  validates :order, :numericality => {greater_than_or_equal_to: 0}
  validates :title_en, presence: true, allow_blank: false
  validates :title_ja, presence: true, allow_blank: false
  validates :image_url, presence: true, allow_blank: true
  validates :content_en, presence: true, allow_blank: true
  validates :content_ja, presence: true, allow_blank: true
  validates :comment, presence: true, allow_blank: true

  validates :category, presence: true, if: 'self.category_id?'
  belongs_to :category, optional: true

  default_value_for :image_url, ''
  default_value_for :content_en, ''
  default_value_for :content_ja, ''
  default_value_for :comment, ''
end
