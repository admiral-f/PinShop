class Order < ActiveRecord::Base
  validates :order, presence: true
end
