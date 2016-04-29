require 'test_helper'

class ConveyancingCalculatorTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ConveyancingCalculator::VERSION
  end

  def test_vat
    assert_equal 0.2, ConveyancingCalculator::VAT
  end
end
