class Pin < ActiveRecord::Base
  validates :label, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :material, presence: true
end
