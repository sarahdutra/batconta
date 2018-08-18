class SpentsController < ApplicationController
  before_action :set_spent, only: [:show, :edit, :update, :destroy]

  # GET /spents
  # GET /spents.json
  def index
    @spents = Spent.all
  end

  # GET /spents/1
  # GET /spents/1.json
  def show
  end

  # GET /spents/new
  def new
    @spent = Spent.new
  end

  # GET /spents/1/edit
  def edit
  end

  # POST /spents
  # POST /spents.json
  def create
    @spent = Spent.new(spent_params)

    respond_to do |format|
      if @spent.save
        format.html { redirect_to @spent, notice: 'Spent was successfully created.' }
        format.json { render :show, status: :created, location: @spent }
      else
        format.html { render :new }
        format.json { render json: @spent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spents/1
  # PATCH/PUT /spents/1.json
  def update
    respond_to do |format|
      if @spent.update(spent_params)
        format.html { redirect_to @spent, notice: 'Spent was successfully updated.' }
        format.json { render :show, status: :ok, location: @spent }
      else
        format.html { render :edit }
        format.json { render json: @spent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spents/1
  # DELETE /spents/1.json
  def destroy
    @spent.destroy
    respond_to do |format|
      format.html { redirect_to incomes_url, notice: 'Spent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spent
      @spent = Spent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spent_params
      params.require(:spent).permit(:category, :value, :description)
    end
end
