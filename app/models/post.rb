class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :url, presence: true
  validates :headline, presence: true
  

  def domain
    if self.url.blank?
      nil
    else
      pu = URI.parse(self.url)
      pu.host.gsub(/^www\d*\./, "")
    end
  end
  
end
