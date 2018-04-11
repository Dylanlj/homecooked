class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    # @reservations = Reservation.all
    @reservations = Reservation.where(user: current_user)
    @user = User.find(current_user.id)
    # @user = User.where(id: current_user.id)
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.status = "Pending Approval"
    respond_to do |format|
      if @reservation.save
        format.js
        # format.html { redirect_to reservations_url, notice: 'Reservation was successfully created.' }
        # format.json { render :show, status: :created, location: @reservation }
      else
        format.js
        # format.html { render :new }
        # format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # FUNCTION TO CHANGE STATUS TO ACCEPTED ON BUTTON CLICK --- Want to make it an AJAX CALL
  def accept
    @reservation = Reservation.find(params[:id])
    @reservation.status = "Accepted"
    @reservation.save
    redirect_to reservations_url
  end

  # FUNCTION TO CHANGE STATUS TO REJECTED ON BUTTON CLICK --- Want to make it an AJAX CALL
  def reject
    @reservation = Reservation.find(params[:id])
    @reservation.status = "Rejected"
    @reservation.save
    redirect_to reservations_url
  end

  # ADDED FOR SHOWING HOSTS RESERVATIONS FOR THEIR MEALS
  def outgoingreservations
    @user = User.find(current_user.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:meal_posting_id, :user_id, :number_of_people, :allergies, :time)
    end
end
