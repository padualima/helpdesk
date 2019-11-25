class ApplicationController < ActionController::Base
  def after_sign_out_path_for(resource_or_scope)
    frontoffice_root_path
  end
  private

  def prepare_form
    @sector_calleds = SectorCalled.all.map { |s| [s.sector.name, s.id ] }
    @priorities = ["Sem-Prioridade", "Pouco urgente", "Semi-urgente", "Urgente"]
    @status = ["Aguardando atendimento","Stand-by", "Cancelado" ,"Finalizado"]
  end
end
