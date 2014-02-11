class HomeController < ApplicationController
  def index
    response = Unirest.get("http://api.dronestre.am/data")

    if response.body["status"] == "OK"
      strikes = response.body["strike"]
      gon.strikes = strikes
      @strikes = strikes
    end
  end

  def about
  end
end
