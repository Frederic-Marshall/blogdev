class Post < ApplicationRecord
  validates :title, :summary, :body, presence: true
  
  mount_uploader :image, ImageUploader
  has_rich_text :body

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  belongs_to :category
  belongs_to :user

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create! 
    end
  end
end
