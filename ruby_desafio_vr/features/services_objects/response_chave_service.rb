require 'httparty'

class ResponseChave
  include HTTParty

  def consulta_endpoint
      @response = HTTParty.get("https://portal.vr.com.br/api-web/comum/enumerations/VRPAT")
     return @response
  end
end
