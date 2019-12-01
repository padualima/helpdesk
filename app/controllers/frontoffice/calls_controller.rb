class Frontoffice::CallsController < FrontofficeController
  before_action :set_orders, only:[:edit, :update]
  def index
    information
    @orders_open = Order.where(sector_called_id: @sector_called).where(status: "Aguardando atendimento")
    @orders_finished = Order.where(status: "Finalizado").where(user_finished: current_user.id)
    @sector_called =  SectorCalled.where(sector_id: @user_sector)
    @orders_finished_all = Order.where(status: "Finalizado").where(sector_called: @sector_called)
    @orders_user_finished = Order.where(status: "Finalizado").where(user_finished: current_user.id)
    date_finished_user
    date_finished_sector
  end

  def finished
    prepare_form
    @order = Order.find(params[:call_id])
    if @order.update(user_finished: current_user.id, status: "Finalizado", date_finished: Date.today)
      redirect_to frontoffice_calls_path
    end
  end
  def edit
    prepare_form
  end

  def update
    if @order.update(calls_params)
      redirect_to frontoffice_calls_path
    else
      prepare_form
    end
  end

  private

  def information
    @user_sector = current_user.sector
    @sector_called =  SectorCalled.where(sector_id: @user_sector.id)
  end

  def set_orders
    @order = Order.find(params[:id])
  end

  def calls_params
    params.require(:order).permit(:user_id, :sector_called_id, :title, :description, :status, :priority)
  end

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
