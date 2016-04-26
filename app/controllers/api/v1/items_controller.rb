module Api
  module V1
    class ItemsController < ApiController
      def index
        render json: Item.all, serializer: ItemIndexSerializer
      end
    end
  end
end
