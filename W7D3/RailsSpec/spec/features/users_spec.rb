require 'rails_helper'

feature 'creating a user', type: :feature do

  before :each do
    create(:user)
    
  end

end