require "test_helper"

class ConveyancingCalculator::PurchaseTest < Minitest::Test
  def purchase_calculator(purchase_price)
    ConveyancingCalculator::Purchase.new(purchase_price)
  end

  def test_fee_when_price_is_100k
    calc = purchase_calculator(100000)

    assert_equal 450.00, calc.fee
  end

  def test_fee_when_price_is_150k
    calc = purchase_calculator(150000)

    assert_equal 475.00, calc.fee
  end

  def test_fee_when_price_is_250k
    calc = purchase_calculator(250000)

    assert_equal 525.00, calc.fee
  end

  def test_fee_when_price_is_350k
    calc = purchase_calculator(350000)

    assert_equal 575.00, calc.fee
  end

  def test_fee_when_price_is_450k
    calc = purchase_calculator(450000)

    assert_equal 625.00, calc.fee
  end

  def test_fee_when_price_is_550k
    calc = purchase_calculator(550000)

    assert_equal 700.00, calc.fee
  end

  def test_fee_when_price_is_650k
    calc = purchase_calculator(650000)

    assert_equal 750.00, calc.fee
  end

  def test_fee_when_price_is_750k
    calc = purchase_calculator(750000)

    assert_equal 800.00, calc.fee
  end

  def test_total
    calc = purchase_calculator(100000)

    assert_equal 540.00, calc.total
  end
end
