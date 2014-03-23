class GistEdit < ActiveRecord::Base

  belongs_to(:gist)
  belongs_to(:user)

end
