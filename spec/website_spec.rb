require 'spec_helper'

describe Website do
	context 'with no parameters' do
		it 'should raise an ArgumentError' do
			expect{ Website.new }.to raise_error(ArgumentError)
		end
	end	

	context 'given a URL' do
		it 'should create an instance of Website' do
			website = Website.new('http://www.example.com')
			website.should be_an_instance_of Website
		end
	end

	describe '#search' do
		it 'should get a response' do
			@response = stub_request(:get, 'http://api.angel.co/1/search/slugs?query=some_name').to_return(:status => 200, :body => '', :headers => {})
		end

		it 'should find a company' do
			@company = stub_request(:get, "http://api.angel.co/1/search/startups/@response['id]").to_return(:status => 200, :body => "{name: 'example'}", :headers => {})
		end
	end
end
