class Initiative < ActiveRecord::Base
  has_many :deliverables, :dependent => :destroy
  has_and_belongs_to_many :portfolios
  belongs_to :phase
  validates :title,:description,:phase_id, presence: true


  def self.get_by_user(user_id)
    Initiative.all
  end

end
