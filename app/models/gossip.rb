class Gossip < ApplicationRecord
	belongs_to :user, required: false
	has_many :tags

	validates :title, presence: true
	validates :content, presence: true
end
