class UnifyMatchmakersController < ApplicationController
  def create
  	begin
	    build_object
	    @object.save!
	    render json: @object.json
  	rescue Exception => e
  		render json: {"fail": e.message}.json
  	end
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
    matchmaker.country = params["country"]

    params["languages"].each do |lang|
    	matchmaker.unify_matchmaker_mappings.build(language_id: DimLanguage.find_by_name(lang).id)
		end

		params["communities"].each do |cast|
    	matchmaker.unify_matchmaker_mappings.build(caste_id: DimCaste.find_by_name(cast).id)
		end

		params["religions"].each do |religion|
    	matchmaker.unify_matchmaker_mappings.build(religion_id: DimCaste.find_by_name(religion).id)
		end
  end
end
