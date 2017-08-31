# Classe para carregar a home do jogo
class Homemat
  include Capybara::DSL
  def visitpage
    visit 'http://www.somatematica.com.br/matkids/game.php'
  end
end
# Class para executar os calculos
class Acoesjogo
  include Capybara::DSL

  def name
    fill_in name: 'nome', with: 'Darling'
    find(:xpath, ' /html/body/div/table/tbody/tr/td/form/center/p/font[2]/input[5]').click
    find(:xpath, '/html/body/div/table/tbody/tr/td/form/center/p/input').click
  end

  def calc
    @op = find(:xpath, '/html/body/div[1]/center/table/tbody/tr/td[2]/div/center/table/tbody/tr[1]/td[1]/p/font/b').text
    @a = find(:xpath, ' /html/body/div/center/table/tbody/tr/td[2]/div/center/table/tbody/tr[1]/td[2]/font/b').text.to_i
    @b = find(:xpath, ' /html/body/div/center/table/tbody/tr/td[2]/div/center/table/tbody/tr[2]/td/font/b').text.to_i
    case @op
    when '+'
      @c = (@a + @b)
    when '-'
      @c = (@a - @b)
    when '÷'
      @c = (@a / @b)
    when 'x'
      @c = (@a * @b)
    end
  def resp
    fill_in name: 'resposta', with: @c
    find(:xpath, '/html/body/div[1]/center/table/tbody/tr/td[2]/div/center/table/tbody/tr[4]/td/form/p[2]/input').click
  end
  end
end
