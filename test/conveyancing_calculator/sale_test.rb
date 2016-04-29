require "test_helper"

class ConveyancingCalculator::SaleTest < Minitest::Test
  def setup
    ConveyancingCalculator.configure do |config|
      config.sale_fee_bands = [
        { lower_bound: 0, upper_bound: 100000, fee: 425.00 },
        { lower_bound: 100001, upper_bound: 200000, fee: 450.00 },
        { lower_bound: 200001, upper_bound: 300000, fee: 475.00 },
        { lower_bound: 300001, upper_bound: 400000, fee: 525.00 },
        { lower_bound: 400001, upper_bound: 500000, fee: 575.00 },
        { lower_bound: 500001, upper_bound: 600000, fee: 625.00 },
        { lower_bound: 600001, upper_bound: 700000, fee: 700.00 },
        { lower_bound: 700001, fee: 750.00 },
      ]
    end
  end

  def sale_calculator(sale_price)
    ConveyancingCalculator::Sale.new(sale_price)
  end

  def test_fee_when_price_is_100k
    calc = sale_calculator(100000)

    assert_equal 425.00, calc.fee
  end

  def test_fee_when_price_is_150k
    calc = sale_calculator(150000)

    assert_equal 450.00, calc.fee
  end

  def test_fee_when_price_is_250k
    calc = sale_calculator(250000)

    assert_equal 475.00, calc.fee
  end

  def test_fee_when_price_is_350k
    calc = sale_calculator(350000)

    assert_equal 525.00, calc.fee
  end

  def test_fee_when_price_is_450k
    calc = sale_calculator(450000)

    assert_equal 575.00, calc.fee
  end

  def test_fee_when_price_is_550k
    calc = sale_calculator(550000)

    assert_equal 625.00, calc.fee
  end

  def test_fee_when_price_is_650k
    calc = sale_calculator(650000)

    assert_equal 700.00, calc.fee
  end

  def test_fee_when_price_is_750k
    calc = sale_calculator(750000)

    assert_equal 750.00, calc.fee
  end

  def test_total
    calc = sale_calculator(100000)

    assert_equal 510.00, calc.total
  end
end
