class Initiative < ActiveRecord::Base
  has_many :deliverables, :dependent => :destroy
  has_and_belongs_to_many :portfolios
  belongs_to :phase

end
