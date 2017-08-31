Dado(/^que eu esteja na pagina somatematica$/) do
  @home = Homemat.new
  @home.visitpage
  @action = Acoesjogo.new
end

Quando(/^informo meu nome e seleciono todas operacoes$/) do
  @action.name
end

Quando(/^respondo as questoes$/) do
  15.times do
    @action.calc
    @action.resp
  end
end

Entao(/^devo chegar ao nivel de Genio da Matematica$/) do
  expect(page).to have_content('PARABÉNS!!!')
end
