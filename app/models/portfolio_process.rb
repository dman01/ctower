class PortfolioProcess < ActiveRecord::Base
  has_many :portfolios
  has_many :phases

  def self.list_by_user(user_id)
    PortfolioProcess.all
  end

  def self.has_admin_rights(user_id)
    TRUE
  end
end
