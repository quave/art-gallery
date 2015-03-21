class Work < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true

  def self.default_scope
    where enabled: true
  end

  has_attached_file :image,
                    :styles => { :preview => '200' },
                    :default_url => '/images/default.png'
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }
end
