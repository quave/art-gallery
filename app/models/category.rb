class Category < ActiveRecord::Base
  has_many :works
  validates :name, presence: true
  default_scope { order(:order) }
end
