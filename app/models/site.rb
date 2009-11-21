class Site < ActiveRecord::Base
  has_many :keywords
  has_many :requests
end
