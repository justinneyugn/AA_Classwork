require 'action_view'

class Cat < ApplicationRecord 
    include ActionView::Helpers::DateHelper

    CAT_COLORS = %w(black white orange brown).freeze

    validates :birth_date, presence: true
    validates :color, presence: true, inclusion: CAT_COLORS
    validates :name, presence: true 
    validates :sex, presence: true, inclusion: {in: ["M", "F"]}
    validates :description, presence: true



    def age
        time_ago_in_words(birth_date)
    end

    

    





end
