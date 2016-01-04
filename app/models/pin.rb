class Pin < ActiveRecord::Base
  validates :label, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :material, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },
                     default_url: "/images/:style/missing.png",
                     :keep_old_files => :true
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/]
end
