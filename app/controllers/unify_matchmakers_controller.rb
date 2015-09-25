#Register account service /app/services/save-account => post and /app/services/view-account => get
class UnifyMatchmakersController < ApplicationController
  before_filter :check_user_session

  def view_account
    render json: {fail: 'not implemented'}, status: :unprocessable_entity
  end
=begin
  The main table is unify_matchmakers, but as Matchmakers select multiple Religion,Language and community we have a mapping table unify_matchmakers_mapping.

  Most of the information on the account page goes to the unify_matchmakers table. But the religion => language =>caste relationship is kept in unify_matchmaker_mapping table as there could be multiple records for a single matchmaker
  
=end
  def save_account
    debugger
  	begin
	    build_object
	    @object.save!
	    render json: @object.to_json(
      include: {
        unify_matchmakers_mappings: {include: [:dim_religion, :dim_caste, :dim_language]}
    })
  	rescue Exception => e
      logger.exc
  		render json: {fail: e.message}, status: :unprocessable_entity
  	end
  end

  private
  #Build object for save_account
  def build_object
    @object = UnifyMatchmaker.new
    @object.company_name = params["business_name"]
    @object.biz_location = params["business_location"]

    @object.phone = params["phone_number"].to_s.gsub(/[^0-9]/,'')
    @object.phone = 0 if @object.phone.blank?
    @object.address_1 = params["address_first"]
    @object.address_2 = params["address_second"]
    @object.state = params["state"]
    @object.city = params["city"]
    @object.country =params["country"]
    (params["languages"]||[]).each do |lang|
    	@object.unify_matchmakers_mappings.build(language: lang)
		end
		(params["community"]||[]).each do |cast|
    	@object.unify_matchmakers_mappings.build(caste: cast)
		end
		(params["religions"]||[]).each do |religion_id|
    	@object.unify_matchmakers_mappings.build(religion_id: religion_id)
		end
  end
end
