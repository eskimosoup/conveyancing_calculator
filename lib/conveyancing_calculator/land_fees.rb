module ConveyancingCalculator
  class LandFees
    attr_reader :purchase_price

    def initialize(purchase_price)
      @purchase_price = purchase_price.to_d
    end

    def fee
      @fee ||= land_fee_band[:fee]
    end

    def total
      fee + vat
    end

    def vat
      fee * ConveyancingCalculator.configuration.vat_rate
    end

    private

    def land_fee_band
      sorted_land_fee_bands.detect{ |band| purchase_price > band[:lower_bound] }
    end

    def sorted_land_fee_bands
      land_fees.sort_by{ |band| band[:lower_bound] }.reverse
    end

    def land_fees
      [
        { lower_bound: 0, upper_bound: 80_000, fee: 20.00 },
        { lower_bound: 80_001, upper_bound: 100_000, fee: 40.00 },
        { lower_bound: 100_001, upper_bound: 200_000, fee: 95.00 },
        { lower_bound: 200_001, upper_bound: 500_000, fee: 135.00 },
        { lower_bound: 500_001, upper_bound: 1_000_000, fee: 270.00 },
        { lower_bound: 1_000_001, fee: 455.00 }
      ]
    end
  end
end
