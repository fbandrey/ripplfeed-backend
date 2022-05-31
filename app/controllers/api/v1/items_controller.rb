class Api::V1::ItemsController < Api::V1::BaseController

  before_action :load_item, only: :destroy

  def index
    items = ItemsSearch.new({ user_id: current_user.id })
                       .results
                       .order(created_at: :desc)
    render json: items, each_serializer: Items::FeedSerializer
  end

  def create
    service = Services::Items::Create.new(item_params, current_user)
    if service.call && service.run_processing
      render json: service.item, serializer: Items::CreateSerializer
    else
      render_errors service.item.errors_as_json
    end
  end

  def destroy
    service = Services::Items::Destroy.new(@item)
    if service.call
      head :ok
    else
      render_errors service.item.errors_as_json
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :text
    )
  end

  def load_item
    @item = ::Items::Base.find(params[:id])
  end

end
