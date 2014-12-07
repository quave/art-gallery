class Work < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true
  validates :image_name, presence: true
end
