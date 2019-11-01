class CommentBi < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end
