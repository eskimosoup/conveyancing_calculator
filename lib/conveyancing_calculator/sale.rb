module ConveyancingCalculator
  class Sale
    attr_reader :sale_price

    def initialize(sale_price)
      @sale_price = sale_price.to_d
    end

    def fee
      @fee ||= sale_fee_band[:fee]
    end

    def total
      fee + vat
    end

    def vat
      fee * ConveyancingCalculator::VAT
    end

    private

    def sale_fee_band
      sorted_sale_fee_bands.detect{ |band| sale_price > band[:lower_bound] }
    end

    def sorted_sale_fee_bands
      ConveyancingCalculator::SALE_FEE_BANDS.sort_by{ |band| band[:lower_bound] }.reverse
    end
  end
end
