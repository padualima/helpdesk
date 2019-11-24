puts "Creando Sectores"
sectors = ["Recepcção", "Coordenação", "Diretoria", "Serviço Geral", "Cantina", "Psicologia",
  "Almoxarifado", "Suporte TI", "Manutenção", "Professores", "Auxiliar de Coordenação",
  "Portaria", "Financeiro", "Call Center, Caixa", "Secretaria", "NIP"].sort
  sectors_called = [16,8,1].sort
  sectors.each do |s|
    Sector.find_or_create_by!(name: s)
  end
  puts "Setores Criados"

  puts "Criando setores dos HelpDesk"
  sectors_called.each do |s|
    SectorCalled.find_or_create_by!(sector_id: s)
  end
  puts "Setores Criados"

  PASSWORDS = "112233"
  puts "Criando o Admin"
    Admin.create!(
      email: "admin@help.com",
      password: PASSWORDS,
      password_confirmation: PASSWORDS
    )
  puts "Admin Criado"
  puts "Admin Email: admin@help.com, Senha: 112233 "
  puts "Criando Funcionários"
  65.times do
    User.create!(
      name: Faker::Name.name,
      username: Faker::Internet.username,
      email: Faker::Internet.email,
      password: PASSWORDS,
      password_confirmation: PASSWORDS,
      sector_id: Sector.all.ids.sample
    )
  end
  puts "Funcionarios Criados"
