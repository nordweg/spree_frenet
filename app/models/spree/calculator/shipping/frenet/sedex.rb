require_dependency 'spree/calculator'

module Spree::Calculator::Shipping::Frenet
  class Sedex < Spree::Calculator::Shipping::Frenet::Base
    FRENET_SERVICE_CODE = '03220'

    def self.description
      "Frenet - Correios Sedex"
    end
  end
end
