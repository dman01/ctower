class PhasesController < ApplicationController
  # GET /phases
  # GET /phases.json
  def index
    if params[:process_id]
      @process=PortfolioProcess.find(params[:process_id])
      @phases=@process.phases
    else
      @process=nil
    end

    respond_to do |format|
      if @process.nil?
        format.html { redirect_to portfolio_processes_path() }
      else
        format.html # index.html.erb
        format.json { render json: @phases }
      end
    end
  end


  # GET /phases/new
  # GET /phases/new.json
  def new
    @phase = Phase.new
    if params[:process_id]
      @process=PortfolioProcess.find(params[:process_id])
    else
      @process=nil
    end

    respond_to do |format|
      if @process.nil?
        #Go to the process overview page
        format.html { redirect_to portfolio_processes_path() }
      else
        format.html # new.html.erb
        format.json { render json: @phase }
      end
    end
  end

  # GET /phases/1/edit
  def edit
    @phase = Phase.find(params[:id])
    @process=@phase.portfolio_process
  end

  # POST /phases
  # POST /phases.json
  def create
    @phase = Phase.new(params[:phase])

    respond_to do |format|
      if @phase.save
        format.html { redirect_to phases_path(notice: 'Phase was successfully created.',process_id: @phase.portfolio_process_id) }
        format.json { render json: @phase, status: :created, location: @phase }
      else
        format.html { render action: "new" }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /phases/1
  # PUT /phases/1.json
  def update
    @phase = Phase.find(params[:id])

    respond_to do |format|
      if @phase.update_attributes(params[:phase])
        format.html { redirect_to phases_path(notice: 'Phase was successfully updated.', process_id: @phase.portfolio_process_id) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phases/1
  # DELETE /phases/1.json
  def destroy
    @phase = Phase.find(params[:id])
    @phase.destroy

    respond_to do |format|
      format.html { redirect_to phases_url }
      format.json { head :ok }
    end
  end
end
