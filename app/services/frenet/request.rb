class Frenet::Request
  def initialize; end

  def get(path, body={})
    response = request.get(path, body)
    log_error(response) unless response.success?
    response.body
  end

  def post(path, body={})
    response = request.post(path, body)
    byebug
    log_error(response) unless response.success?
    response.body
  end

  private

  def request
    @request ||= Faraday.new(url:"http://api.frenet.com.br") do |conn|
      conn.request :json
      conn.response :json
      conn.adapter :net_http
      conn.headers[:token] = ENV["FRENET_TOKEN"] ||  Rails.application.secrets.frenet_token
    end
  end

  def log_error(response)
    puts "SPREE_FRENET: Request returned the following error"
    puts "Status: #{response.status}\nBody: #{response.body}"
  end

end
