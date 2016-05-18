class Financiation < ActiveRecord::Base

  has_many :lanes
  accepts_nested_attributes_for :lanes
end
