require "test_helper"

class ConveyancingCalculator::SaleTest < Minitest::Test
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
