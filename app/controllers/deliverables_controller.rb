class DeliverablesController < ApplicationController
  # GET /deliverables
  # GET /deliverables.json
  def index
    @deliverables = Deliverable.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deliverables }
    end
  end

  # GET /deliverables/1
  # GET /deliverables/1.json
  def show
    @deliverable = Deliverable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deliverable }
    end
  end

  # GET /deliverables/new
  # GET /deliverables/new.json
  def new
    @deliverable = Deliverable.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deliverable }
    end
  end

  # GET /deliverables/1/edit
  def edit
    @deliverable = Deliverable.find(params[:id])
  end

  # POST /deliverables
  # POST /deliverables.json
  def create
    @deliverable = Deliverable.new(params[:deliverable])

    respond_to do |format|
      if @deliverable.save
        format.html { redirect_to @deliverable, notice: 'Deliverable was successfully created.' }
        format.json { render json: @deliverable, status: :created, location: @deliverable }
      else
        format.html { render action: "new" }
        format.json { render json: @deliverable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /deliverables/1
  # PUT /deliverables/1.json
  def update
    @deliverable = Deliverable.find(params[:id])

    respond_to do |format|
      if @deliverable.update_attributes(params[:deliverable])
        format.html { redirect_to @deliverable, notice: 'Deliverable was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @deliverable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deliverables/1
  # DELETE /deliverables/1.json
  def destroy
    @deliverable = Deliverable.find(params[:id])
    @deliverable.destroy

    respond_to do |format|
      format.html { redirect_to deliverables_url }
      format.json { head :ok }
    end
  end
end
