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

    # SUBTRACTS NUMBER OF SERVINGS ON RESERVATION FROM THE MEAL POSTING'S SERVINGS
    @meal_posting = MealPosting.find(params[:id])
    puts "-------------------- #{@meal_posting.inspect} -----------------------"
    @meal_posting.servings = @meal_posting.servings - @reservation.number_of_people
    puts "-------------------- #{@meal_posting.inspect} -----------------------"
    @meal_posting.save
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
    if current_user.user_status === "Host"
      @user = User.find(current_user.id)
    else
      redirect_to root_path
    end
  end


  def order

    @reservation = Reservation.find(params[:id])
    @reservation.paid = "yes"
    @reservation.stripe_charge_id = params[:stripeToken]

    @amount = @reservation.number_of_people * @reservation.meal_posting.cost * 100

    charge = Stripe::Charge.create(
      :source      => params[:stripeToken],
      :amount      => @amount,
      :description => 'HomeCooked Charge',
      :currency    => 'cad'
    )

    if @reservation.save!
      redirect_to reservations_path(@reservation.user), notice: 'Your Order has been placed.'
    else
      redirect_to reservations_path(@reservation.user), flash: { error: order.errors.full_messages.first }
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
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
