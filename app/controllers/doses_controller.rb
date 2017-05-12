class DosesController < ApplicationController
    before_action :find_dose, only: [:destroy]
    before_action :find_cocktail, only: [:create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.new(dose_params)
    if @dose.save
      redirect_to @cocktail
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose.destroy
    redirect_to @dose.cocktail
  end

 private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
