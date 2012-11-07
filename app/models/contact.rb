class Contact < ActiveRecord::Base
  attr_accessible :birthday, :email, :firstname, :fullname, :lastname

  belongs_to :group
end
