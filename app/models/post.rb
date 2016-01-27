class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :user_id, presence: true
  validates :type, presence: true
end
