require 'spec_helper'
describe

describe ApplicationHelper do
	describe "get true ul from string" do
	  it "http://google.com/?q=qwe" do 
			@url_string = "http://google.com/?q=qwe"
      true_url(@url_string).scheme.should == "http"   
      true_url(@url_string).host.should == "google.com"   
      true_url(@url_string).path.should == "/"   
		end
	  it "google.com" do
			@url_string = "google.com"
      true_url(@url_string).scheme.should == "http"   
      true_url(@url_string).host.should == "google.com"   
      true_url(@url_string).path.should == "/"   
		end
	  it "google.com/mail" do
			@url_string = "google.com/mail"
      true_url(@url_string).scheme.should == "http"   
      true_url(@url_string).host.should == "google.com"   
      true_url(@url_string).path.should == "/mail"   
		end
	  it "/users" do
			@url_string = "/users"
      true_url(@url_string).scheme.should == "http"   
      true_url(@url_string).host.should == "base"   
      true_url(@url_string).path.should == "/users"   
		end
	  it "blank" do
			@url_string = ""
      true_url(@url_string).should == nil   
		end
	end


	describe "check url availabality" do
		require "net/http"
		it "/" do
		  check_url("/").should be_true 
		end
		it "/users" do
		  check_url("/users").should be_true 
		end
		it "base/users" do
		  check_url("base/users").should be_true 
		end
		it "http://base/users" do
		  check_url("http://base/users").should be_true 
		end
		it "google.com" do
		  check_url("google.com").should be_true 
		end
		it "http://google.com/" do
		  check_url("http://google.com/").should be_true 
		end
		it "google-fucking-url.com" do
		  check_url("google-fucking-url.com").should be_false 
		end
		it "/failed_pages" do
		  check_url("/failed_pages").should be_false 
		end

	end

end
