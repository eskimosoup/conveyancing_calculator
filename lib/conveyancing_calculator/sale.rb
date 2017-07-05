module ConveyancingCalculator
  class Sale
    attr_reader :sale_price, :symbolised_location

    def initialize(sale_price, symbolised_location)
      @sale_price = sale_price.to_d
      @symbolised_location = symbolised_location
    end

    def fee
      @fee ||= sale_fee_band[:fee]
    end

    def total
      fee + vat
    end

    def vat
      fee * ConveyancingCalculator.configuration.vat_rate
    end

    private

    def sale_fee_band
      sorted_sale_fee_bands.detect{ |band| sale_price > band[:lower_bound] }
    end

    def sorted_sale_fee_bands
      ConveyancingCalculator.configuration.sale_fee_bands[symbolised_location].sort_by{ |band| band[:lower_bound] }.reverse
    end
  end
end
