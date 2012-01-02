class Phase < ActiveRecord::Base
  belongs_to :portfolio_process
  has_many :initiatives
  validates :title,:description, presence: true
  validates :portfolio_process_id,numericality: true
end
