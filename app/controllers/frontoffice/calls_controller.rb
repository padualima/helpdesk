class Frontoffice::CallsController < FrontofficeController
  before_action :set_orders, only:[:edit, :update]
  def index
    @orders = Order.where(status: "Aguardando atendimento")
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

  def set_orders
    @order = Order.find(params[:id])
  end

  def calls_params
    params.require(:order).permit(:user_id, :sector_called_id, :title, :description, :status, :priority)
  end
end
