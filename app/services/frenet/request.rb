class Frenet::Request
  def initialize; end

  def post(path, body={})
    begin
      response = request.post(path, body)
      response.body
    rescue Exception => e
      p "FRENET: Request return the following error:"
      p e.message
      {
        status: "Error",
        message: e.message
      }
    end
  end

  def get(path, body={})
    begin
      response = request.get(path, body)
      response.body
    rescue Exception => e
      p "FRENET: Request return the following error:"
      p e.message
      {
        status: "Error",
        message: e.message
      }
    end
  end

  private

  def request
    @request ||= Faraday.new(url:"http://api.frenet.com.br") do |conn|
      conn.request :json
      conn.response :json
      conn.adapter :net_http
      conn.headers[:token] = Rails.application.secrets.frenet_token
    end
  end

end
