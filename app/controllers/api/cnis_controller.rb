class Api::CnisController < ApplicationController
    before_action :add_log

    def findRecepisse
        r = params[:recep]
        @query = Cni.where(numeroRecepisse: r)
        if @query.empty?
            render json: {
                status: :fail,
                message: :not_found
            }
        else 
            render json: {
                status: :found,
                message: :found,
                data: @query
            }
        end
    end

    private

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