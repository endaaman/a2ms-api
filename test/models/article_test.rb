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

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
