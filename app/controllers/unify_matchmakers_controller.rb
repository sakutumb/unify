class UnifyMatchmakersController < ApplicationController
  def create
    build_object
    @object.save!
  end

  private

  def build_object
    matchmaker = UnifyMatchmaker.new
    matchmaker.company_name = params["biz-name"]
    #matchmaker.???? = params["biz-location"]
    matchmaker.phone = params["phone"]
    matchmaker.address_1 = params["address-line1"]
    matchmaker.address_2 = params["address-line2"]
    matchmaker.state = params["state-province"]
    matchmaker.city = params["city"]

    matchmaker.unify_matchmaker_mappings.build
  end
end
