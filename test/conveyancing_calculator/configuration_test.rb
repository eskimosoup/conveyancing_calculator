require "test_helper"

class ConveyancingCalculator::ConfigurationTest < Minitest::Test

  def test_default_vat_rate
    config = ConveyancingCalculator::Configuration.new

    assert_equal 0.2, config.vat_rate
  end

  def test_vat_rate
    config = ConveyancingCalculator::Configuration.new
    config.vat_rate = 5

    assert_equal 5, config.vat_rate
  end

  def test_raises_error_if_sale_fee_bands_not_set
    config = ConveyancingCalculator::Configuration.new
    
    assert_raises(ConveyancingCalculator::ConfigurationError) do
      config.sale_fee_bands
    end
  end

  def test_sale_fee_band_configuration
    config = ConveyancingCalculator::Configuration.new
    config.sale_fee_bands = "Sale fee bands set"

    assert_equal "Sale fee bands set", config.sale_fee_bands
  end

  def test_raises_error_if_purchase_fee_bands_not_set
    config = ConveyancingCalculator::Configuration.new
    
    assert_raises(ConveyancingCalculator::ConfigurationError) do
      config.purchase_fee_bands
    end
  end

  def test_purchase_fee_band_configuration
    config = ConveyancingCalculator::Configuration.new
    config.purchase_fee_bands = "Purchase fee bands set"

    assert_equal "Purchase fee bands set", config.purchase_fee_bands
  end
end
