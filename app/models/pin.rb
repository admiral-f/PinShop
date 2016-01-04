class Pin < ActiveRecord::Base
  validates :label, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :material, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
