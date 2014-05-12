class MagazinesController < ApplicationController
  def show
    @magazine = Magazine.find(params[:id])
  end
end