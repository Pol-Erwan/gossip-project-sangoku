class Tag < ApplicationRecord
  has_many :gossip_to_tags
  has_many :gossips, through: :gossip_to_tags
end
