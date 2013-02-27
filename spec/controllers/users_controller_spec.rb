require 'spec_helper'

describe UsersController do

  describe "GET 'recovery'" do
    it "returns http success" do
      get 'recovery'
      response.should be_success
    end
  end

end
