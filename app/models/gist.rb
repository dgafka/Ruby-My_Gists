class Gist < ActiveRecord::Base

  has_many(:gist_edits);
  belongs_to(:language)

  scope :sorted, lambda { order("gists.created_at DESC") }
  scope :pagination, lambda { limit() }
end
