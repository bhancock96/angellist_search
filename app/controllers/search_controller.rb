class SearchController < ApplicationController
	def index
	end

	def compare
		website = Website.new(params[:site])
		if website.search['company_url'] == nil
			flash[:notice] = 'This company does not have a company url listed'
		else
			@matched_company = website.site_match
			flash[:notice] = "No company found with that website" if !@matched_company
		end	

	end
end

