# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :user_id, presence: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :post_subs,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :PostSub

  has_many :comments,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Comment

  has_many :subs,
    through: :post_subs,
    source: :sub

  # belongs_to :sub,
  #   primary_key: :id,
  #   foreign_key: :sub_id,
  #   class_name: :Sub

  # has_and_belongs_to_many :subs

end
