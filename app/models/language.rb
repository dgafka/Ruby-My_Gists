class Language < ActiveRecord::Base

  has_many(:gists)


  scope :sorted, lambda { order("languages.name DESC") }

end
