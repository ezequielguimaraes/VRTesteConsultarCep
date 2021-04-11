module Viacep
    module Rest
      class ConsultaCep
        include HTTParty
  
        headers 'Content-Type' => 'application/json'
  
        base_uri URL['url_default']
  
        def get_endereco(data)
          result_set = self.class.get('/' "#{data}" '/json/')
          result_set
        end
      end
    end
  end