class Ad < ActiveRecord::Base
  attr_accessible :content
  attr_accessible :email
  
  belongs_to :category
  belongs_to :user
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :content,     :presence => true
  validates :email,       :presence => true,
                          :format   => { :with => email_regex }
  validates :category_id, :presence => true  
  
  
  default_scope :order => 'ads.created_at DESC'
end
