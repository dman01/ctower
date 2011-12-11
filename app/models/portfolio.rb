class Portfolio < ActiveRecord::Base
 has_and_belongs_to_many :initiatives
 belongs_to :portfolio_process

  def self.list_by_user(user_id)
    Portfolio.all
  end
end
