class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates :user, :conversation, :message, :reply, presence: true
end
