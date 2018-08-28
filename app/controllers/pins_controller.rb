class PinsController < ApplicationController
  before_action :find_pin, only: [:show, :edit, :update, :destroy]


  def index
    @pins = Pin.all.order("created_at DESC")
  end

  def new
    @pin = current_user.pins.build
  end

  def create
    @pin = current_user.pins.build(pins_params)
    if @pin.save
      redirect_to pins_path, notice: "Pin successfully created."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @pin.update(pins_params)
      redirect_to pins_path, notice: 'Pin successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_path, notice: 'Pin successfully deleted.'
  end 

    private

    def find_pin
      @pin = Pin.find(params[:id])
    end

    def pins_params
      params.require(:pin).permit(:title, :image)
    end
end
