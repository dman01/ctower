require 'test_helper'

class PortfolioTest < ActiveSupport::TestCase
  fixtures :portfolios,:portfolio_processes



  # test "the truth" do
  #   assert true
  # end

    test "By the book" do
      #Get portfolio and process from fixtures
      p=portfolios(:Portfolio1)
      pp=portfolio_processes(:Process1)
      p.portfolio_process_id=pp.id
      assert p.save,"oops, failed to save the portfolio by the book"
      #Check number of initiatives, should be 3 based on the fixture specification
      assert_equal(p.initiatives.count(),3, "Should have 3 associated initiatives was #{p.initiatives.count}")
    end

  #Check that validations are in place
  test "validate title and description" do
    p=Portfolio.new
    assert !p.save, "Saved  a portfolio without neither title nor description"
  end
  test "validate presence of title" do
    p=Portfolio.new
    p.description="This is the really important portfolio description"
    assert !p.save, "Saved a portfolio without title"
  end
  test "validate presence of description" do
    p=Portfolio.new
    p.title="Magic portfolio 1"
    assert !p.save, "Saved  a portfolio without description "
  end

  test "validate presence of portfolio process" do
    p=Portfolio.new
    p.title="Magic portfolio 1"
    p.description="This is the really important portfolio description"
    assert !p.save, "Saved  a portfolio without portfolio process associated "
  end


end
