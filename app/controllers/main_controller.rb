class MainController < ApplicationController
  def index
    @peaks = Peak.desc(:updated_at).limit(5)
  end
end
