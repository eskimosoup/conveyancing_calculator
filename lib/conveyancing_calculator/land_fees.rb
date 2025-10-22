module ConveyancingCalculator
  class LandFees
    attr_reader :purchase_price, :new_build

    def initialize(purchase_price, new_build: false)
      @purchase_price = purchase_price.to_d
      @new_build = new_build
    end

    def fee
      @fee ||= land_fee
    end

    def total
      fee + vat
    end

    def vat
      fee * ConveyancingCalculator.configuration.vat_rate
    end

    private

    def land_fee
      land_fee_band[:fee]
    end

    def land_fee_band
      sorted_land_fee_bands.detect { |band| purchase_price >= band[:lower_bound] }
    end

    def sorted_land_fee_bands
      if new_build
        land_fees_new_build.sort_by{ |band| band[:lower_bound] }.reverse
      else
        land_fees_existing.sort_by{ |band| band[:lower_bound] }.reverse
      end
    end

    #
    # Existing
    #
    # @see https://www.gov.uk/guidance/hm-land-registry-registration-services-fees#scale-1-fees
    #
    # @return [hash]
    #
    def land_fees_existing
      [
        { lower_bound: 0, upper_bound: 80_000, fee: 20.00 },
        { lower_bound: 80_001, upper_bound: 100_000, fee: 40.00 },
        { lower_bound: 100_001, upper_bound: 200_000, fee: 100.00 },
        { lower_bound: 200_001, upper_bound: 500_000, fee: 150.00 },
        { lower_bound: 500_001, upper_bound: 1_000_000, fee: 295.00 },
        { lower_bound: 1_000_001, fee: 500.00 }
      ]
    end

    #
    # New build
    #
    # @see https://www.gov.uk/guidance/hm-land-registry-registration-services-fees#scale-1-fees
    #
    # @return [hash]
    #
    def land_fees_new_build
      [
        { lower_bound: 0, upper_bound: 80_000, fee: 45.00 },
        { lower_bound: 80_001, upper_bound: 100_000, fee: 95.00 },
        { lower_bound: 100_001, upper_bound: 200_000, fee: 230.00 },
        { lower_bound: 200_001, upper_bound: 500_000, fee: 330.00 },
        { lower_bound: 500_001, upper_bound: 1_000_000, fee: 655.00 },
        { lower_bound: 1_000_001, fee: 1105.00 }
      ]
    end
  end
end
