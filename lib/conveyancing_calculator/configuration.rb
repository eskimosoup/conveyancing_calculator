module ConveyancingCalculator
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end


  class Configuration
    attr_accessor :vat_rate
    attr_writer :sale_fee_bands, :purchase_fee_bands

    def initialize
      @vat_rate = 0.2
      @sale_fee_bands = nil
      @purchase_fee_bands = nil
    end

    def sale_fee_bands
      raise ConveyancingCalculator::ConfigurationError, "Sale fee bands have not been set" if @sale_fee_bands.nil?
      @sale_fee_bands
    end

    def purchase_fee_bands
      raise ConveyancingCalculator::ConfigurationError, "Purchase fee bands have not been set" if @purchase_fee_bands.nil?
      @purchase_fee_bands
    end
  end
end
