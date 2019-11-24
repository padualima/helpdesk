class Frontoffice::OrdersController < FrontofficeController
  before_action :set_orders, only: [:edit, :update]
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    prepare_form
  end

  def edit
    prepare_form
  end

  def create
    @order = Order.new(orders_users_params)
    @order.update(user_id: current_user.id, status: "Aguardando atendimento")
    if @order.save
      redirect_to frontoffice_orders_path
    else
      prepare_form
    end
  end

  def update
    if @order.update(orders_users_params)
      redirect_to frontoffice_orders_path
    else
      prepare_form
    end
  end

  private

  def set_orders
    @order = Order.find(params[:id])
  end

  def prepare_form
    @sector_calleds = SectorCalled.all.map { |s| [s.sector.name, s.id ] }
    @priorities = ["Sem-Prioridade", "Pouco urgente", "Semi-urgente", "Urgente"]
  end

  def orders_users_params
    params.require(:order).permit(:user_id, :sector_called_id, :title, :description, :status, :priority)
  end
end
