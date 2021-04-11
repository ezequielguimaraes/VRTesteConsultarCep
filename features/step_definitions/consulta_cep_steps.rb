Dado("possuo um CEP padrão") do |table|
    @cep = (table.rows_hash['cep'])
  end
  
  Quando("consultar informando um CEP válido") do
    @response_body = cep.get_endereco(@cep)
  
    @data = {
        'cep' => @response_body['cep'],
        'logradouro' => @response_body['logradouro'],
        'complemento' => @response_body['complemento'],
        'bairro' => @response_body['bairro'],
        'localidade' => @response_body['localidade'],
        'uf' => @response_body['uf'],
        'unidade' => @response_body['unidade'],
        'ibge' => @response_body['ibge'],
        'gia' => @response_body['gia']
    }
  
  end
  
  Então("a API deve retornar os dados do CEP informado") do
    expect(@data['cep'].equal?(@cep))
    puts @response_body
  end
  
  
  Então("a API deve retornar os dados de endereço e IBGE do CEP informado") do
    expect(@data['cep'].equal?(@cep))
    puts "\n#Endereço: #{@data['logradouro']} \n#Bairro: #{@data['bairro']}\n#Cidade: #{@data['localidade']} \n#Estado: #{@data['uf']} \n#IBGE: #{@data['ibge']}"
  end
  
  Então("a API deverá retornar erro na aplicação") do
    expect(@response_body['erro']).to eq true
    puts @response_body
  end

  E('devo receber uma resposta com status code {int}') do |status_code|
    expect(@response_body.code).to eql status_code
  end
  