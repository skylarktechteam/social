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
      #removed Json method page 214
      #def as_json(options={})
      	#super(except: [:user_id], include: :user,
      #	methods: :cached_comment_count)
      #end

end
