class WaitlistRequestsController < ApplicationController
  before_action :set_waitlist_request, only: [:show, :edit, :update, :destroy]

  # GET /waitlist_requests
  # GET /waitlist_requests.json
  def index
    @waitlist_requests = WaitlistRequest.all
  end

  # GET /waitlist_requests/1
  # GET /waitlist_requests/1.json
  def show
  end

  # GET /waitlist_requests/new
  def new
    @waitlist_request = WaitlistRequest.new
  end

  # GET /waitlist_requests/1/edit
  def edit
  end

  # POST /waitlist_requests
  # POST /waitlist_requests.json
  def create
    @waitlist_request = WaitlistRequest.new(waitlist_request_params)

    respond_to do |format|
      if @waitlist_request.save
        format.html { redirect_to @waitlist_request, notice: 'Waitlist request was successfully created.' }
        format.json { render :show, status: :created, location: @waitlist_request }
      else
        format.html { render :new }
        format.json { render json: @waitlist_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /waitlist_requests/1
  # PATCH/PUT /waitlist_requests/1.json
  def update
    respond_to do |format|
      if @waitlist_request.update(waitlist_request_params)
        format.html { redirect_to @waitlist_request, notice: 'Waitlist request was successfully updated.' }
        format.json { render :show, status: :ok, location: @waitlist_request }
      else
        format.html { render :edit }
        format.json { render json: @waitlist_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waitlist_requests/1
  # DELETE /waitlist_requests/1.json
  def destroy
    @waitlist_request.destroy
    respond_to do |format|
      format.html { redirect_to waitlist_requests_url, notice: 'Waitlist request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waitlist_request
      @waitlist_request = WaitlistRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def waitlist_request_params
      params.require(:waitlist_request).permit(:first_name, :last_name, :email, :native_language, :learning_language, :city, :country)
    end
end
