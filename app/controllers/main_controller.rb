class MainController < ApplicationController
  def index
    @peaks = Peak.all
  end
end
