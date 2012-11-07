class Group < ActiveRecord::Base
  attr_accessible :name
  has_many :contacts,:dependent => :destroy
end
