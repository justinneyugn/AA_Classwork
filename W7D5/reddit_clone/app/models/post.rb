# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :text
#  content    :text
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
    validates :title, :url, :content, :sub_id, :author_id, presence:true

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    belongs_to :sub,
        foreign_key: :sub_id,
        class_name: :Sub

    has_many :cross_sub_posts,
        foreign_key: :post_id,
        class_name: :PostSub
end
