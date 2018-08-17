class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update]

  def index
    @dogs = Dog.all
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to dog_path(@dog)
    else
      redirect_to new_dog_path
    end
  end

  def edit
  end

  def update
    if @dog.update dog_params
      redirect_to dog_path(@dog)
    else
      redirect_to edit_dog_path @dog
    end
  end

  def delete
    dog = Dog.find params[:id]
    dog.destroy
    redirect_to dogs_path
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:age,:name,:breed,:employee_name)
  end
end
