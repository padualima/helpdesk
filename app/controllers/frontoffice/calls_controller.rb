class Frontoffice::CallsController < FrontofficeController
  before_action :set_orders, only:[:finished, :edit, :update]
  def index
    @orders = Order.where(status: "Aguardando atendimento")
  end

  def finished
    prepare_form
  end
  def edit
    prepare_form
  end

  def update
    if @order.update(user_finished: current_user.id, status: "Finalizado", date_finished: Date.today)
      redirect_to frontoffice_calls_path
    end
  end

  private

  def set_orders
    @order = Order.find(params[:id])
  end

  def calls_params
    params.require(:order).permit(:user_id, :sector_called_id, :title, :description, :status, :priority, :user_finished, :date_finished)
  end
end
