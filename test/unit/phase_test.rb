require 'test_helper'

class PhaseTest < ActiveSupport::TestCase
  fixtures :portfolio_processes
  # test "the truth" do
  #   assert true
  # end
  test "By the book" do
    pp=portfolio_processes(:Process1)
    phase=Phase.new
    phase.title="p1"
    phase.description="p1 descr"
    phase.portfolio_process_id=pp.id
    assert phase.save,"Oops, this one should have been by the book"
  end

  test "Omitting title" do
    pp=portfolio_processes(:Process1)
    phase=Phase.new
    #phase.title="p1"
    phase.description="p1 descr"
    phase.portfolio_process_id=pp.id
    assert !phase.save,"Shouldnt be able of saving without title"
  end

  test "Omitting description" do
      pp=portfolio_processes(:Process1)
      phase=Phase.new
      phase.title="p1"
      #phase.description="p1 descr"
      phase.portfolio_process_id=pp.id
      assert !phase.save,"Shouldnt be able of saving without description"
    end

   test "Omitting link to portfolio_process" do
      pp=portfolio_processes(:Process1)
      phase=Phase.new
      phase.title="p1"
      phase.description="p1 descr"
      #phase.portfolio_process_id=pp.id
      assert !phase.save,"Shouldnt be able of saving without link to connected portfolio_process"
    end
  end
