# == Schema Information
#
# Table name: users
#
#  id                                                              :bigint           not null, primary key
#  created_at                                                      :datetime         not null
#  updated_at                                                      :datetime         not null
#  email                                                           :string           not null
#  #<ActiveRecord::ConnectionAdapters::PostgreSQL::TableDefinition :string
#
class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
end
