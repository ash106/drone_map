class HomeController < ApplicationController
  def index
    response = Unirest.get("http://api.dronestre.am/data")

    if response.body["status"] == "OK"
      min_deaths = 0
      max_deaths = 0
      strikes = response.body["strike"]
      for strike in strikes
        min_deaths += strike["deaths_min"].to_i
        max_deaths += strike["deaths_max"].to_i
      end
      gon.strikes = strikes
      @strikes = strikes
      @deaths = "between #{min_deaths} and #{max_deaths}"
    end
  end

  def about
  end
end
