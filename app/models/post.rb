class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :url, presence: true
  validates :headline, presence: true
  
end
