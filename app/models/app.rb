class App < ActiveRecord::Base
  has_many :categories
  accepts_nested_attributes_for :categories
end
