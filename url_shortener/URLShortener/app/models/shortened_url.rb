# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#  short_url  :string
#
class ShortenedUrl < ApplicationRecord 
  validates :long_url, :user_id, :short_url, presence: true, uniqueness: true 

  def self.random_code
    url = SecureRandom::urlsafe_base64
    until !ShortenedUrl.exists?(short_url: url)
      url = SecureRandom::urlsafe_base64
    end
    url
  end

  

end
