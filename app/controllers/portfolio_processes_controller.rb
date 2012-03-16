class PortfolioProcessesController < ApplicationController
  # GET /portfolio_processes
  # GET /portfolio_processes.json
  def index
    @portfolio_processes = PortfolioProcess.all

    respond_to do |format|
      format.html # _portfolios.html.erb
      format.json { render json: @portfolio_processes }
    end
  end

  # GET /portfolio_processes/1
  # GET /portfolio_processes/1.json
  def show
    @portfolio_process = PortfolioProcess.find(params[:id])

    respond_to do |format|
      format.html # _show.html.erb
      format.json { render json: @portfolio_process }
    end
  end

  # GET /portfolio_processes/new
  # GET /portfolio_processes/new.json
  def new
    @portfolio_process = PortfolioProcess.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @portfolio_process }
    end
  end

  # GET /portfolio_processes/1/edit
  def edit
    @portfolio_process = PortfolioProcess.find(params[:id])
  end

  # POST /portfolio_processes
  # POST /portfolio_processes.json
  def create
    @portfolio_process = PortfolioProcess.new(params[:portfolio_process])

    respond_to do |format|
      if @portfolio_process.save
        #Now, create a first phases just to avoid processes that have no phases whatsoever
        phase=Phase.new
        phase.title="Mobilize"
        phase.description="Start working on the project scope"
        phase.portfolio_process_id=@portfolio_process.id
        phase.save

        phase=Phase.new
        phase.title="Execute"
        phase.description="Start delivering in iterations"
        phase.portfolio_process_id=@portfolio_process.id
        phase.save


        phase=Phase.new
        phase.title="Transition"
        phase.description="Ensure that the project outcome has been handed over to the organization"
        phase.portfolio_process_id=@portfolio_process.id
        phase.save

        format.html { redirect_to @portfolio_process, notice: 'Portfolio process was successfully created.' }
        format.json { render json: @portfolio_process, status: :created, location: @portfolio_process }
      else
        format.html { render action: "new" }
        format.json { render json: @portfolio_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /portfolio_processes/1
  # PUT /portfolio_processes/1.json
  def update
    @portfolio_process = PortfolioProcess.find(params[:id])

    respond_to do |format|
      if @portfolio_process.update_attributes(params[:portfolio_process])
        format.html { redirect_to @portfolio_process, notice: 'Portfolio process was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @portfolio_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_processes/1
  # DELETE /portfolio_processes/1.json
  def destroy
    @portfolio_process = PortfolioProcess.find(params[:id])
    @portfolio_process.destroy

    respond_to do |format|
      format.html { redirect_to portfolio_processes_url }
      format.json { head :ok }
    end
  end
end
