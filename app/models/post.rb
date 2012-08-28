class Post < ActiveRecord::Base
  attr_accessible :body, :title
  
  validates :title, :presence => true
  validates :body, :presence => true, :length => { :minimum => 50 }
end
