class User < ActiveRecord::Base

  has_many(:gist_edits)

end
