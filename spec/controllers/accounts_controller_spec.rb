require 'spec_helper'

describe AccountsController do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'withdraw'" do
    it "returns http success" do
      get 'withdraw'
      response.should be_success
    end
  end

end
