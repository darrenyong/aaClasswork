# == Schema Information
#
# Table name: responses
#
#  id          :bigint(8)        not null, primary key
#  answer_id   :integer          not null
#  question_id :integer          not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
