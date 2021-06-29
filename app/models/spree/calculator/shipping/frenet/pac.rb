require_dependency 'spree/calculator'

module Spree::Calculator::Shipping::Frenet
  class Pac < Spree::Calculator::Shipping::Frenet::Base
    FRENET_SERVICE_CODE = '03298'

    def self.description
      "Frenet - Correios PAC"
    end
  end
end
