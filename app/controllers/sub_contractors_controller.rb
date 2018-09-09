class SubContractorsController < ApplicationController
  before_action :set_sub_contractor, only: [:show, :edit, :update, :destroy]
  
  def index
    @sub_contractors = SubContractor.all || []
  end
  def show
  end
  def new
    @sub_contractor = SubContractor.new
  end
  def create
    @sub_contractor = SubContractor.new(sub_contractor_params)

    respond_to do |format|
      if logged_in?
        if @sub_contractor.save
          format.html { redirect_to @sub_contractor, notice: 'Created subcontractor successfully' }
          format.json { render :show, location: @sub_contractor, status: :created }
        else
          format.html { render :new }
          format.json { render json: @sub_contractor.errors, status: :unprocessable_entity }
        end
      else
        @sub_contractor.errors.add(:_, 'Only logged in users can add new subcontractors.')
        format.html { render :new }
        format.json { render json: @sub_contractor.errors, status: :unauthorized }
      end
    end
  end
  def edit
  end
  def update
    respond_to do |format|
      if logged_in?
        if @sub_contractor.update(sub_contractor_params)
          format.html { redirect_to @sub_contractor, notice: 'Updated subcontractor succesfully.' }
          format.json { render :show, location: @sub_contractor, status: :ok }
        else
          format.html { render :edit }
          format.json { render json: @sub_contractor.errors, status: :unprocessable_entity }
        end
      else
        @sub_contractor.errors.add(:_, 'Only logged in users can edit sub contractors')
        format.html { render :edit }
        format.json { render json: @sub_contractor.errors, status: :unauthorized }
      end
    end
  end
  def destroy
    respond_to do |format|
      if logged_in?
        @sub_contractor.destroy

        format.html { render :index, notice: 'Delete subcontractor successfully' }
        format.json { head :no_content }
      else
        @sub_contractor.errors.add(:_, 'Only logged in users can delete subcontractors')
        
        format.html { render :edit, location: @sub_contractor }
        format.json { render json: @sub_contractor.errors, status: :unauthorized }
      end
    end
  end

  private

  def set_sub_contractor
    return nil if !params[:id]

    @sub_contractor = SubContractor.find(params[:id])
  end 
  def sub_contractor_params
    params.require(:sub_contractor).permit(
      :name
    )
  end
end
