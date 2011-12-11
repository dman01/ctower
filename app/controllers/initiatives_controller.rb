class InitiativesController < ApplicationController
  # GET /initiatives
  # GET /initiatives.json
  def index
    @initiatives = Initiative.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @initiatives }
    end
  end

  # GET /initiatives/1
  # GET /initiatives/1.json
  def show
    @initiative = Initiative.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @initiative }
    end
  end

  # GET /initiatives/new
  # GET /initiatives/new.json
  def new
    @initiative = Initiative.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @initiative }
    end
  end

  # GET /initiatives/1/edit
  def edit
    @initiative = Initiative.find(params[:id])
  end

  # POST /initiatives
  # POST /initiatives.json
  def create
    #@initiative = Initiative.new(params[:initiative])
    @initiative = Initiative.new
    @initiative.title=params[:initiative][:title]
    @initiative.description=params[:initiative][:description]
    @initiative.phaseId=params[:initiative][:phaseId]
    @portfolio_ids=params[:portfolios]
    @initiative.portfolio_ids=@portfolio_ids

    respond_to do |format|
      if @initiative.save
        format.html { redirect_to @initiative, notice: 'Initiative was successfully created.' }
        format.json { render json: @initiative, status: :created, location: @initiative }
      else
        format.html { render action: "new" }
        format.json { render json: @initiative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /initiatives/1
  # PUT /initiatives/1.json
  def update
    @initiative = Initiative.find(params[:id])
    @portfolio_ids=params[:portfolios]
    @initiative.portfolio_ids=@portfolio_ids

    respond_to do |format|
      if @initiative.update_attributes(params[:initiative])
        format.html { redirect_to @initiative, notice: 'Initiative was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @initiative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /initiatives/1
  # DELETE /initiatives/1.json
  def destroy
    @initiative = Initiative.find(params[:id])
    @initiative.destroy

    respond_to do |format|
      format.html { redirect_to initiatives_url }
      format.json { head :ok }
    end
  end
end
