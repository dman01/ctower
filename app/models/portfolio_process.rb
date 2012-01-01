class PortfolioProcess < ActiveRecord::Base
  has_many :portfolios
  has_many :phases
  validates :title,:description, presence: true

  def self.list_by_user(user_id)
    PortfolioProcess.all
  end


  def self.has_admin_rights(user_id)
    TRUE
  end
end
