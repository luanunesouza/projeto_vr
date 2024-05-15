require 'JSON'

Dado('que esteja acessando o endpoint de produto VR') do
  @response_endpoint = ResponseChave.new
  @response = @response_endpoint.consulta_endpoint
end

Então('valido que a chave é typeOfEstablishment') do
  expect(@response.code).to eq 200
  response_objeto_json = JSON.parse(@response.to_s)
  if response_objeto_json.has_key?("typeOfEstablishment")
#    puts "Foi encontrada a chave typeOfEstablishment na response da requisição"
    puts "O estabelecimento selecionado aleatóriamente foi: #{response_objeto_json['typeOfEstablishment'][rand(0..55)]}"
  else
    puts "A response da requisição não possui a chave typeOfEstablishment"
    break
  end
end
