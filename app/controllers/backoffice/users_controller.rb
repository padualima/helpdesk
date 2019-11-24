class Backoffice::UsersController < BackofficeController
  before_action :set_users, only: [:edit, :update]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    prepare_form
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to backoffice_users_path
    else
      prepare_form
    end
  end

  def update
    # binding.pry
    if @user.update(users_params)
      redirect_to backoffice_users_path
    else
      prepare_form
    end
  end

  private

  def set_users
    @user = User.find(params[:id])
  end

  def prepare_form
    @sectors = Sector.all.map { |s| [s.name, s.id]  }
  end

  def users_params
    params.require(:user).permit(:name, :username, :sector_id ,:email, :password, :password_confirmation)
  end
end
