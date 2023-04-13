class ArtworkSharesController < ApplicationController

    def create
        @artwork_share = ArtworkShare.new(artwork_share_params)

        if @artwork_share.save
            render json: @artwork_share
        else
            render json: @artwork_share.errors.full_messages, status: 422
        end
    end

    def artwork_share_params
        params.require(:artwork).permit(:artwork_id, :viewer_id)
    end

    def destroy
        @artwork_share = ArtworkShare.find(params[:id])
        
        if @artwork_share.destroy
            render json: ArtworkShare.all
        else
            render json: @artwork_share.errors.full_messages, status: 422
        end
    end

end