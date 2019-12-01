class Frontoffice::DashboardController < FrontofficeController
  def index
    @orders_user_finished = Order.where(status: "Finalizado").where(user_finished: current_user.id)
    @user_sector = current_user.sector.id
    @sector_called =  SectorCalled.where(sector_id: @user_sector)
    @orders_finished_all = Order.where(status: "Finalizado").where(sector_called: @sector_called)
    @orders_user_finished = Order.where(status: "Finalizado").where(user_finished: current_user.id)
    date_finished_user
    date_finished_sector
  end

  private

  def date_finished_sector
    month_actual = Date.today.strftime("%Y-%m")
    @amount_sector = 0
    @orders_finished_all.each do |o|
      a = o.date_finished.to_s.slice 0..-4
      if a == month_actual
        @amount_sector +=1
      end
    end
    return @amount_sector
  end

  def date_finished_user
    month_actual = Date.today.strftime("%Y-%m")
    @amount_user = 0
    @orders_user_finished.each do |o|
      a = o.date_finished.to_s.slice 0..-4
      if a == month_actual
        @amount_user +=1
      end
    end
    return @amount_user
  end
end
