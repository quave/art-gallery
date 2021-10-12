class Work < ApplicationRecord
  belongs_to :category
  validates :name, presence: true

  def self.default_scope
    order(:order, :created_at)
  end

  scope :shown, -> { where enabled: true }
  scope :hidden, -> { where enabled: false }

  has_one_attached :image
  #field :image, :active_storage
  attr_accessor :remove_image
  after_save { image.purge if remove_image == '1' }
  #delete_method :remove_image

=begin
  has_attached_file :image,
                    :styles => { :preview => '250' },
                    :default_url => '/images/default.png'
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }
=end
  rails_admin do
    list do
      field :id
      field :enabled
      field :image
      field :name
      field :description
      field :size
      field :category
      field :price
      field :order
    end
    edit do
      field :enabled
      field :image
      field :name
      field :description
      field :size
      field :category
      field :price
      field :order
    end
  end
end
