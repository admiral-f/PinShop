class Category < ActiveRecord::Base
  has_many :pins
  validates :title, presence: true, length: { maximum: 50 }
end
