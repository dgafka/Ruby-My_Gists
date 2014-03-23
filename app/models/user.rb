class User < ActiveRecord::Base

  has_secure_password

  has_many(:gist_edits)


  validates :username, :length => { :within => 1..25 },
            :uniqueness => true

end
