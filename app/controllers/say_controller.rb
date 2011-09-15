class SayController < ApplicationController
  def hello
    @dtmTime=Time.now
  end

  def byebye
  end

end
