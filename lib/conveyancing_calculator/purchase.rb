module ConveyancingCalculator
  class Purchase
    attr_reader :purchase_price

    def initialize(purchase_price)
      @purchase_price = purchase_price.to_d
    end

    def fee
      @fee ||= purchase_fee_band[:fee]
    end

    def total
      fee + vat
    end

    def vat
      fee * ConveyancingCalculator::VAT
    end

    private

    def purchase_fee_band
      sorted_purchase_fee_bands.detect{ |band| purchase_price > band[:lower_bound] }
    end

    def sorted_purchase_fee_bands
      ConveyancingCalculator::PURCHASE_FEE_BANDS.sort_by{ |band| band[:lower_bound] }.reverse
    end
  end
end
