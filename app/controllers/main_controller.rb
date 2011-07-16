class MainController < ApplicationController
  def index
    @peaks = Peak.desc(:updated_at).limit(3)
    @equipments = Equipment.desc(:updated_at).limit(3)
  end
end
