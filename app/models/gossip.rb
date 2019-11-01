class Gossip < ApplicationRecord
  validates :title, length: { in: 3..14 }
  validates :content, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :gossip_to_tags
  has_many :tags, through: :gossip_to_tags
end
