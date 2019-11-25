module ApplicationHelper
  def confimation
    SectorCalled.all.each do |call|
      if call.sector.id == current_user.sector.id
        return true
      end
    end
  end

  def percentage
    (@amount_user * 100) / @amount_sector
  end

end
