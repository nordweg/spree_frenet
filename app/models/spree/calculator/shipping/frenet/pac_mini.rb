require_dependency 'spree/calculator'

module Spree::Calculator::Shipping::Frenet
  class PacMini < Spree::Calculator::Shipping::Frenet::Base
    FRENET_SERVICE_CODE = '04227'

    def self.description
      "Frenet - Correios PAC Mini Envios"
    end
  end
end
