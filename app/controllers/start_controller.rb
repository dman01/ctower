class StartController < ApplicationController
  def index
    respond_to do |format|
          format.js
          format.html
        end
  end

  def about
  end


  def caseStudies
    respond_to do |format|
      format.js
     # format.html
    end
  end
  
  def approach
    respond_to do |format|
      format.js
      #format.html
    end

  end

end
