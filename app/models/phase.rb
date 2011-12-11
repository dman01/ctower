class Phase < ActiveRecord::Base
  belongs_to :portfolio_process
  has_many :initiatives
end
