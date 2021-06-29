require_dependency 'spree/calculator'

module Spree::Calculator::Shipping::Frenet
  class Azul < Spree::Calculator::Shipping::Frenet::Base
    FRENET_SERVICE_CODE = 'Azul_WS'

    def self.description
      "Frenet - Azul Cargo"
    end
  end
end
