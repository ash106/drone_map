class HomeController < ApplicationController
  def index
    response = Unirest.get("http://api.dronestre.am/data")

    if response.body["status"] == "OK"
      strikes = response.body["strike"]
      strike_locs = []
      for strike in strikes
        strike_locs.push({ number: strike["number"], lat: strike["lat"], lon: strike["lon"] })
      end
      gon.strike_locs = strike_locs
    end
  end
end
