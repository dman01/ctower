class MoveAgain < ActiveRecord::Migration
  def change

    p=Portfolio.first
    Initiative.all.each do |i|

      i.portfolio_id=p.id
      i.save
    end

  end
end
