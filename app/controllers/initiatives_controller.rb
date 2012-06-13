class InitiativesController < ApplicationController
  # GET /initiatives
  # GET /initiatives.json

  layout nil

  def index


    @initiatives = Portfolio.find(params[:portfolio_id]).initiatives
    @portfolio_id=params[:portfolio_id]

    respond_to do |format|
      #format.js
      format.html # _index.html.erb
      format.json { render json: @initiatives }

    end
  end

  def list
      @initiatives = Portfolio.find(params[:portfolio_id]).initiatives
      @portfolio_id=params[:portfolio_id]

      respond_to do |format|
        #format.js
        format.html {render partial: 'initiatives'}
        format.json { render json: @initiatives }

      end
    end

  # GET /initiatives/1
  # GET /initiatives/1.json
  def show
    @initiative = Initiative.find(params[:id])

    respond_to do |format|
      format.html # _show.html.erb
      format.json { render json: @initiative }
    end
  end

  # GET /initiatives/new
  # GET /initiatives/new.json
  def new
    @initiative = Initiative.new
    @portfolio_id=params[:portfolio_id]
    respond_to do |format|
      format.html {render partial: 'form'}
      format.json { render json: @initiative }
    end
  end

  # GET /initiatives/1/edit
  def edit
    @initiative = Initiative.find(params[:id])

    respond_to do |format|
      #format.html # new.html.erb
      format.js
    end
  end

  # POST /initiatives
  # POST /initiatives.json
  def create
    #@initiative = Initiative.new(params[:initiative])
    @initiative = Initiative.new
    @initiative.title=params[:initiative][:title]
    @initiative.description=params[:initiative][:description]
    @initiative.start=params[:initiative][:start]
    @initiative.end=params[:initiative][:end]
    @initiative.portfolio_id=params[:portfolio_id]
    @initiative.phase_id=params[:phase_id]
    @initiative.completionDegree=params[:initiative][:completionDegree]



    #
    # Default to the first phase in the chosen portfolio




    respond_to do |format|
      if @initiative.save
        #format.js
        format.html { render partial: 'success' }
        format.json { render json: @initiative, status: :created, location: @initiative }
      else
        #format.js
        format.html { render partial: 'fail' }
        format.json { render json: @initiative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /initiatives/1
  # PUT /initiatives/1.json
  def update
    @initiative = Initiative.find(params[:id])
    @initiative.phase_id=params[:phase_id]

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
