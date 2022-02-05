class Cat < ApplicationRecord 
    # i think we need require 'date'
    include ActionView::Helpers::DateHelper

    validates :birth_date, presence: true
    validates :color, presence: true, inclusion: {in: ["red","orange", "yellow", "green", "blue","brunette"]}
    validates :name, presence: true 
    validates :sex, presence: true, inclusion: {in: ["M", "F"]}
    validates :description, presence: true



    def age
        time_ago_in_words(birth_date)
    end

    

    





end
