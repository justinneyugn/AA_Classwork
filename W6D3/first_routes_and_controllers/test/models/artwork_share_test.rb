# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artwork_id :integer
#  viewer_id  :integer
#
require 'test_helper'

class ArtworkShareTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
