class BullshitsController < ApplicationController
  before_action :set_bullshit, only: %i[ show edit update destroy ]
  http_basic_authenticate_with :name => "user", :password => ENV["BASIC_AUTH"], only: :basic_auth

  # GET /bullshits or /bullshits.json
  def index
    @bullshits = current_user.bullshits
  end

  # GET /bullshits/1 or /bullshits/1.json
  def show
  end

  # GET /bullshits/new
  def new
    @bullshit = Bullshit.new
  end

  # GET /bullshits/1/edit
  def edit
  end

  # POST /bullshits or /bullshits.json
  def create
    @bullshit = Bullshit.new(bullshit_params)
    @bullshit.user_id = current_user.id

    respond_to do |format|
      if @bullshit.save
        format.html { redirect_to bullshit_url(@bullshit), notice: "Bullshit was successfully created." }
        format.json { render :show, status: :created, location: @bullshit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bullshit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bullshits/1 or /bullshits/1.json
  def update
    respond_to do |format|
      if @bullshit.update(bullshit_params)
        format.html { redirect_to bullshit_url(@bullshit), notice: "Bullshit was successfully updated." }
        format.json { render :show, status: :ok, location: @bullshit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bullshit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bullshits/1 or /bullshits/1.json
  def destroy
    @bullshit.destroy!

    respond_to do |format|
      format.html { redirect_to bullshits_url, notice: "Bullshit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def basic_auth
  end

  def rules
  end

  def search
    search_term = params[:search]
    if search_term.blank?
      @bullshits = []
    else
      @bullshits = current_user.bullshits.where("title LIKE ? OR description LIKE ? OR random_field LIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bullshit
      @bullshit = Bullshit.find(params[:id])
      raise "Wrong User" if @bullshit.user_id != current_user.id
    end

    # Only allow a list of trusted parameters through.
    def bullshit_params
      params.require(:bullshit).permit(:title, :description, :random_field)
    end
end
