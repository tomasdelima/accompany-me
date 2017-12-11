# require 'rubygems'
# require 'capybara'
require 'capybara/dsl'

Capybara.run_server = false
Capybara.current_driver = :selenium
Capybara.app_host = 'http://www4.fazenda.rj.gov.br/sefaz-dfe-nfae/paginas/identificacao.faces'

module MyCapybaraTest
  class Test
    include Capybara::DSL
    def identificacao
      visit('?')

      find('#tipoRemetenteSelecionado').find(:xpath, 'option[5]').select_option
      fill_fields(field_sets[0])

      find('#remetenteTipoOperacao').find(:xpath, 'option[2]').select_option
      choose('remetenteTipoNaturezaOperacao:0')
      fill_fields(field_sets[1])

# debugger
      find('#remetenteOperacaoNatureza').find(:xpath, 'option[1]').select_option
      # find('#remetenteFinalidade').find(:xpath, 'option[2]').select_option
      fill_fields(field_sets[2])

      # find('#identificacaoDestinatario').find(:xpath, 'option[1]').select_option
      fill_fields(field_sets[3])


      # click_button('Pesquisar')
      # sleep(20)
      check_form_validity
    end

    def field_sets
      [
        {
          remetenteCNPJ:           '97.214.886/0001-08',
          remetenteNomePessoa:     'Nome do Contratante',
          remetenteCEP:            '26.040-510',
          remetenteEmail:          'email@email.com',
          remetenteNumero:         '123',
          remetenteTelefone:       '(22) 2222-2222',
          remetenteComplemento:    '456',
          remetenteConfirmarEmail: 'email@email.com',
        }, {
          remetenteOperacaoDataInputDate: '30/05/2016',
          remetenteOperacaoHora:          '12:34',
        }, {
          destinatarioTipoDoc:        'CPF',
          destinatarioNumDoc:         '111.111.111-11',
          destinatarioIE:             '59353292',
          destinatarioNomePessoa:     'Cliente Teste',
        }, {
          identificacaoDestinatario:  'Contribuinte do ICMS',
          destinatarioCEP:            '26.510-480',
          destinatarioNumero:         '12',
          destinatarioComplemento:    'sala 3',
          destinatarioTelefone:       '(21) 1111-1111',
          destinatarioEmail:          'destinatario@email.com',
          destinatarioConfirmarEmail: 'destinatario@email.com',

        }
      ]
    end

    def readonly_fields
      [
        :identificacaoDestinatario,
        :destinatarioLogradouro,
        :destinatarioBairro,
        :destinatarioUF,
      ]
    end

    def fill_fields(fields)
      puts 'Filling fields'
      missing_fields(fields).each do |k, v|
        element = find("##{k}")

        if k == :remetenteOperacaoDataInputDate
          execute_script("$('#remetenteOperacaoDataInputDate').removeAttr('readonly')")
          execute_script("$('#remetenteOperacaoDataInputDate').val('#{v}')")
        else
          element.try(:send_keys, v)
        end
        find('body').click
      end
      sleep(0.1)

      fill_fields(fields) if missing_fields(fields).present?
    end

    def missing_fields(fields)
      fields.select do |k, v|
        field_value = find("##{k}").value
        field_is_invalid = (select_values_dict[v] || v) != field_value
        puts "Warning: expected field '#{k}'' value to be '#{v}', got '#{field_value}'" if field_is_invalid && field_value.present?
        field_is_invalid
      end
    end

    def select_values_dict
      {
        'Contribuinte do ICMS': '1',
        'Contribuinte isento de Inscrição no cadastro de Contribuintes': '2',
        'Não contribuinte': '9',
      }.with_indifferent_access
    end

    def check_form_validity
      mf = missing_fields(field_sets.reduce({}){|m, a| m.merge a})
      # rof = readonly_fields(field_sets.reduce({}){|m, a| m.merge a})
      # rof = readonly_fields - field_sets.keys
      if mf.empty? #&& rof.empty?
        puts 'Form is valid'
      else
        puts "Fields still empty: #{mf}"
        fill_fields(mf)
        check_form_validity
      end
    end
  end
end
