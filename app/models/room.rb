class Room < ApplicationRecord
  belongs_to :user, required: false
  has_many :room_messages, dependent: :destroy,
                          inverse_of: :room
# validates :title, presence: true
end
