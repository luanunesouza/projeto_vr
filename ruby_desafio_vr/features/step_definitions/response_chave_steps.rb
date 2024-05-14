require 'JSON'

Dado('que esteja acessando o endpoint de produto VR') do
  @response_endpoint = ResponseChave.new
  @response = @response_endpoint.consulta_endpoint
end

Então('valido que a chave é typeOfEstablishment') do
  puts "Codigo de Retorno: #{@response.code}\n"
  expect(@response.code).to eq 200
  puts "RESPONSE JSON #{@response}"
  parseBody = JSON.parse(@response.to_json)
  parseBody.each do |item|
    campo_typeOfEstablishment = item['typeOfEstablishment']
  end
  puts "item: #{campo_typeOfEstablishment}"
end
