class Website
	def initialize(site)
		@site = site
	end

	def search
		response = HTTParty.get("https://api.angel.co/1/search/slugs?query=#{@site.split('.')[-2]}")
		company  = HTTParty.get("https://api.angel.co/1/startups/#{response['id']}")
		return company
	end

	def site_match
		if (self.search['company_url'].downcase == @site.downcase) || 
		   (self.search['company_url'].split('.')[-2..-1].join('.').downcase == @site.downcase)
		   correct_company = self.search
		end
	end
end