class Backoffice::SectorCalledsController < ApplicationController
  before_action :set_sector_calleds, only: [:edit, :update]
  def index
    @sector_calleds = SectorCalled.all
  end

  def new
    @sector_called = SectorCalled.new
    prepare_form
  end

  def edit
    prepare_form
    # code
  end

  def create
    @sector_called = SectorCalled.new(sector_calleds_params)

    if @sector_called.save
      redirect_to backoffice_sector_calleds_path
    end
  end

  def update
    if @sector_called.update(sector_calleds_params)
      redirect_to backoffice_sector_calleds_path
    end
  end

  private
  def set_sector_calleds
    @sector_called = Sector.find(params[:id])
  end

  def sector_calleds_params
    params.require(:sector_called).permit(:sector_id)
  end

  def prepare_form
    @sectors = Sector.all.map { |s| [s.name, s.id]  }
  end
end
