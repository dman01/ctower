class Portfolio < ActiveRecord::Base
 has_and_belongs_to_many :initiatives
 belongs_to :portfolio_process
 validates :title, :description,:portfolio_process_id ,presence: true
 validates :portfolio_process_id, numericality: true

  def self.list_by_user(user_id)
    Portfolio.all
  end

  def self.list_by_user_based_on_phase(user_id,phase_id)
   #List all portfolios the user has right to access that are associated with the  process
   #the phase_id belongs to.
   Phase.find(phase_id).portfolio_process.portfolios
  end
end
