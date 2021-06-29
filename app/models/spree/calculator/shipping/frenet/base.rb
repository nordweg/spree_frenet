require_dependency 'spree/calculator'

module Spree::Calculator::Shipping::Frenet
  class Base < Spree::ShippingCalculator

    def compute(object = nil)
      # Low level cache to avoid multiple calls since frenet returns all options in the first call
      shipping_quotes = Rails.cache.fetch("#{object.order.number}/frenet_quotes", expires_in: 10.seconds) do
        ::Frenet::Api.get_shipping_quote(object)
      end
      get_rate_for_shipping_method(shipping_quotes)
    end

    def get_rate_for_shipping_method(shipping_quotes)
      availabe_services = shipping_quotes["ShippingSevicesArray"].reject { |service| service["Error"] == true }
      quote_for_method = availabe_services.detect { |service| service["ServiceCode"] == shipping_method_service_code }
      return nil unless quote_for_method
      {
        delivery_business_days: quote_for_method["DeliveryTime"],
        delivery_transit_business_days: quote_for_method["DeliveryTime"],
        estimated_carrier_price: quote_for_method["ShippingPrice"],
        cost: quote_for_method["ShippingPrice"],
      }
    end

    def shipping_method_service_code
      # Constant defined on each shipping method calculator
      self.class::FRENET_SERVICE_CODE
    end

  end
end
