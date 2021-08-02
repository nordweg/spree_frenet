require_dependency 'spree/calculator'

module Spree::Calculator::Shipping::Frenet
  class Azul < Spree::Calculator::Shipping::Frenet::Base
    FRENET_SERVICE_CODE = 'AZUL_02'

    def self.description
      "Frenet - Azul Cargo"
    end
  end
end
