class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, :presence => true
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :type, presence: true


def cached_comment_count
  Rails.cache.fetch [self, "comment_count"] do
     comments.size
   end
end

end
