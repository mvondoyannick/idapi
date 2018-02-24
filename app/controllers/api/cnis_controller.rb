class Api::CnisController < ApplicationController

    def findRecepisse
        r = params[:recep]
        @query = Cni.where(numeroRecepisse: r)
        if @query.empty?
            render json: {
                status: :echec,
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

end