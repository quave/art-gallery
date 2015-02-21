class Work < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true

  has_attached_file :image,
                    :styles => { :preview => '200' },
                    :default_url => '/images/default.png'
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }

  # field :image do
  #   # set a method available to your asset (defaults to :thumb, :thumbnail or '100x100>' for Dragonfly)
  #   thumb_method :large
  #
  #   # for delete checkbox in forms
  #   delete_method :remove_image     # don't forget to whitelist if you use :attr_accessible
  #
  #   # in case of a validation failure, to retain asset in the form (not available for Paperclip)
  #   cache_method :image_cache       # don't forget to whitelist if you use :attr_accessible
  # end
end
