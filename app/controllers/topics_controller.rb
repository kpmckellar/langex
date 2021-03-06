class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  
  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all
    if current_user.topics != nil
       @current_topics = @current_user.topics 
    else 
      @currrent_topics = nil
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    if current_user.topics != nil
       @current_topics = @current_user.topics 
    else 
      @currrent_topics = [1]
    end
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
  end

  def favorite
    topic = Topic.find(params[:id])
    current_user.topics << topic
    redirect_to topics_path, notice: 'Topic was favorited.'

  end

  def unfavorite
    @topic = Topic.find(params[:id])
    current_user.topics.delete(@topic)
    redirect_to topics_path, notice: 'Topic was unfavorited.'
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id if current_user


    respond_to do |format|
      if @topic.save
        format.html { redirect_to topics_path, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to topics_path, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:user_id, :language_id, :level, :tags_id, :title, :body, :approved, :requestor_topics)
    end
end
