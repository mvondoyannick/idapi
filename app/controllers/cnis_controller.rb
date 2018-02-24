class CnisController < ApplicationController
  before_action :set_cni, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, only: [:new, :destroy]
  before_action :add_log
  protect_from_forgery with: :null_session

  # GET /cnis
  # GET /cnis.json
  def index
    @cnis = Cni.all
  end

  # GET /cnis/1
  # GET /cnis/1.json
  def show
  end

  # GET /cnis/new
  def new
    @cni = Cni.new
  end

  # GET /cnis/1/edit
  def edit
  end

  # POST /cnis
  # POST /cnis.json
  def create
    @cni = Cni.new(cni_params)

    respond_to do |format|
      if @cni.save
        format.html { redirect_to @cni, notice: 'Une nouvelle carte a été créee.' }
        format.json { render :show, status: :created, location: @cni }
      else
        format.html { render :new }
        format.json { render json: @cni.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cnis/1
  # PATCH/PUT /cnis/1.json
  def update
    respond_to do |format|
      if @cni.update(cni_params)
        format.html { redirect_to @cni, notice: 'La carte a été mise a jour avec succes.' }
        format.json { render :show, status: :ok, location: @cni }
      else
        format.html { render :edit }
        format.json { render json: @cni.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cnis/1
  # DELETE /cnis/1.json
  def destroy
    @cni.destroy
    respond_to do |format|
      format.html { redirect_to cnis_url, notice: 'Cni was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cni
      @cni = Cni.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cni_params
      params.require(:cni).permit(:name, :secondName, :numeroRecepisse)
    end

    #permet d'authentifier un utilisateur
    def authenticate
      authenticate_or_request_with_http_basic do |user, password|
        user == "admin" && password == "admin"
      end
    end

    def add_log
      #create new log
      log = Log.new
      # read data from request
      log.browser = request.env['HTTP_USER_AGENT']
      log.address = request.env['REMOTE_ADDR']
      log.controller = controller_name
      log.action = action_name
      log.requestAt = Time.now
      # Save the log
      log.save
      end
end
