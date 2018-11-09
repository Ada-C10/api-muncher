class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session #better for APIs/ adds verify_authenticity_token before all requests, null session subs in an empty session, doesn't change current one

  FOOD_LIST = %W(eggplant chicken potatoes romanesco cherries dragonfruit corn salmon shrimp beans)

  private

  def find_query

    params[:query].blank? ? @query = FOOD_LIST.sample : @query = params[:query]
    # params[:query] ||= FOOD_LIST.sample
    # @query = params[:query]
  end
end
