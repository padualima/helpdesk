class ApplicationController < ActionController::Base

  private

  def prepare_form
    @sector_calleds = SectorCalled.all.map { |s| [s.sector.name, s.id ] }
    @priorities = ["Sem-Prioridade", "Pouco urgente", "Semi-urgente", "Urgente"]
    @status = ["Aguardando atendimento","Stand-by", "Cancelado" ,"Finalizado"]
  end
end
