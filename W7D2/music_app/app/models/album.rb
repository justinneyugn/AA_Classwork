# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  band_id    :integer          not null
#  title      :string           not null
#  year       :integer          not null
#  studio?    :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
    validates :title, :year, :studio?, presence: true
    validates :band_id, presence: true, uniqueness: true

    belongs_to :band,
        primary_key: :id,
        foreign_key: :band_id,
        class_name: :Band
end
