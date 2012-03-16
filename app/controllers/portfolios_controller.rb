class PortfoliosController < ApplicationController
  # GET /portfolios
  # GET /portfolios.json
  def index
 #   @portfolios = Portfolio.list_by_user(session[:user_id])
  #  @processes=PortfolioProcess.list_by_user(session[:user_id])
    #The only time we will arrive here is when the user clicks the portfolio button
    #Assume the first portfolio as chosen
    #
    @portfolio=Portfolio.first


    respond_to do |format|
      format.js
      format.html # _portfolios.html.erb
      format.json { render json: @portfolios }
    end
  end

  # GET /portfolios/1
  # GET /portfolios/1.json
  def show
    @portfolio = Portfolio.find(params[:id])

    respond_to do |format|
      format.html # _show.html.erb
      format.json { render json: @portfolio }
    end
  end

  # GET /portfolios/new
  # GET /portfolios/new.json
  def new
    @portfolio = Portfolio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @portfolio }
    end
  end

  # GET /portfolios/1/edit
  def edit
    @portfolio = Portfolio.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
    @portfolio = Portfolio.new(params[:portfolio])

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to @portfolio, notice: 'Portfolio was successfully created.' }
        format.json { render json: @portfolio, status: :created, location: @portfolio }
      else
        format.html { render action: "new" }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /portfolios/1
  # PUT /portfolios/1.json
  def update
    @portfolio = Portfolio.find(params[:id])

    respond_to do |format|
      @is_updated=true
      if @portfolio.update_attributes(params[:portfolio])
        format.js
        #format.html { redirect_to @portfolio, notice: 'Portfolio was successfully updated.' }
        #format.json { head :ok }
      else
        @is_updated=false
        format.js
        #format.html { render action: "edit" }
        #format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy

    respond_to do |format|
      format.html { redirect_to portfolios_url }
      format.json { head :ok }
    end
  end

  def cancel

      respond_to do |format|
        format.js
      end
    end

end
