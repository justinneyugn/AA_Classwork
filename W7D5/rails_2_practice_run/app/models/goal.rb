class Goal < ApplicationRecord
    validates :name, :details, presence: true
    validates :status, inclusion: {in: [true, false]}

    belongs_to :user,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
end
