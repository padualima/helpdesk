module ApplicationHelper
  def confimation
    SectorCalled.all.each do |call|
      if call.sector.id == current_user.sector.id
        return true
      end
    end
  end

  def percentage
    if @amount_user == 0 && @amount_sector == 0
      return 0
    else
      (@amount_user * 100) / @amount_sector
    end
  end
end
