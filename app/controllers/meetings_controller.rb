class MeetingsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = Meeting.all
    @requestee = User.where(params[:requestee_id])
    @requestor = User.where(params[:requestor_id])
   # @pending_meetings = Meeting.where('accepted = ?', false).includes(:requestor_id)
 
    
    #@pending_meetings.each do |pending_meeting|
     # @requestor = User.where('id = ?', pending_meeting.requestor_id)
   # end

  end

  def show
    @meeting = Meeting.find(params[:id])
  end


  def new
    @requestee = User.where(params[:requestee_id])
    @meeting = Meeting.new
  end

  def edit
  end


  def create
 
    requestor = current_user
    @meeting = Meeting.new(meeting_params)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:requestor_id, :requestee_id, :meeting_time, :accepted)
    end
end
