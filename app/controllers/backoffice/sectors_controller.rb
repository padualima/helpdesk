class Backoffice::SectorsController < ApplicationController
  before_action :set_sectors, only: [:edit, :update]
  def index
    @sectors = Sector.all
  end

  def new
    @sector = Sector.new
  end

  def edit
    # code
  end

  def create
    @sector = Sector.new(sector_params)

    if @sector.save
      redirect_to backoffice_sectors_path
    end
  end

  def update
    if @sector.update(sector_params)
      redirect_to backoffice_sectors_path
    end
  end

  private
  def set_sectors
    @sector = Sector.find(params[:id])
  end

  def sector_params
    params.require(:sector).permit(:name)
  end
end
