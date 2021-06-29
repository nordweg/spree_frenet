class Frenet::Api
  class << self
    def get_shipping_quote(package)
      body = {
        "SellerCEP": package.stock_location.zipcode,
        "RecipientCEP": package.order.ship_address.zipcode.gsub(/-/,""),
        "ShipmentInvoiceValue": package.item_total,
        "ShippingServiceCode": nil,
        "ShippingItemArray": [
          {
            "Height": package.height,
            "Length": package.depth,
            "Width": package.width,
            "Weight": package.weight,
            "Quantity": 1
          }
        ],
        "RecipientCountry": package.order.ship_address.country.iso
      }

      Frenet::Request.new.post("/shipping/quote", body)
    end
  end
end
