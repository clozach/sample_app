require 'spec_helper'

describe ApplicationHelper do

	describe "full_title" do

		# Sample App | Page Title
		# or just...
		# Sample App

		it "should include the page title" do
			full_title("foo").should =~ /foo/
		end

		it "should include the base title" do
			full_title("foo").should =~ /^Sample App/
		end

		it "should only include pipe if full_title provided" do
			full_title("goo").should =~ /\|/		# YES
			full_title("").should_not =~ /\|/		# NO
		end
	end

end