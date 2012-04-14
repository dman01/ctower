class Portfolio < ActiveRecord::Base
 has_many :initiatives
 belongs_to :portfolio_process
 validates :title, :description,:portfolio_process_id ,presence: true
 validates :portfolio_process_id, numericality: true

  def self.list_by_user(user_id)
    Portfolio.all
  end

end
