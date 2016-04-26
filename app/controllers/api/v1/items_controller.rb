module Api
  module V1
    class ItemsController < ApiController
      def index
        render json: Item.all
      end

      def show
        render json: Item.find(params[:id])
      end

      def destroy
        render json: Item.destroy(params[:id])
      end

      def create
        render json: Item.create(item_params)
      end

      private

        def item_params
          params.permit(:name, :description, :image_url)
        end
    end
  end
end
