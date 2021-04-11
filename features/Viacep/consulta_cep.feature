#language:pt
@Viacep_API
Funcionalidade: Consultar CEP
  Consultar dados de endereço informando apenas o CEP para a aplicação.
 

  @cep_valido
  Cenário: inserindo um CEP válido
    Dado possuo um CEP padrão
      | cep | 06415-170 |
    Quando consultar informando um CEP válido
    Então a API deve retornar os dados do CEP informado
    E devo receber uma resposta com status code 200


  @cep_valido_ibge
  Cenário: retornar Endereço e IBGE referentes ao CEP
    Dado possuo um CEP padrão
      | cep | 06415-170 |
    Quando consultar informando um CEP válido
    Então a API deve retornar os dados de endereço e IBGE do CEP informado 
    E devo receber uma resposta com status code 200


  @cep_invalido
  Cenário: inserindo um CEP inválido
    Dado possuo um CEP padrão
      | cep | 99999999 |
    Quando consultar informando um CEP válido
    Então a API deverá retornar erro na aplicação
    E devo receber uma resposta com status code 200