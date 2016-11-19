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

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
