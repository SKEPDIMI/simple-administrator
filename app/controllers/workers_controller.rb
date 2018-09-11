class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]
  def index
    @workers = Worker.all
  end

  def show
  end

  def new
    @worker = Worker.new
    @sub_contractors = SubContractor.all
  end
  def create
    @worker = Worker.create(worker_params)

    respond_to do |format|
      if logged_in?
        if @worker.save
          format.html { redirect_to @worker, notice: 'Created worker successfully'}
          format.json { render :show, location: @worker, status: :created }
        else
          format.html { render :new }
          format.json { render :new, json: @worker.errors, status: :unprocessable_entity }
        end
      else
        @worker.errors.add(:_, 'Only logged in users can create workers')

        format.html { render :index, notice: 'Only logged in users can create workers'}
        format.json { render :index, json: @worker.errors, status: :unauthorized}
      end
    end
  end

  def edit
    @sub_contractors = SubContractor.all
  end

  def update
    respond_to do |format|
      if logged_in?
        if @worker.update(worker_params)
          format.html { redirect_to @worker, notice: 'Updated worker successfully' }
          format.json { render :show, location: @worker, status: :ok }
        else
          format.html { render :edit }
          format.json { render json: @worker.errors, status: :unprocessable_entity }
        end
      else
        @worker.errors.add(:_, 'Only logged in users can edit workers.')

        format.html { render :edit }
        format.json { render json: @worker.errors, status: :unauthorized }
      end
    end
  end

  def destroy
    respond_to do |format|
      if logged_in?
        @worker.destroy

        format.html { redirect_to workers_url, notice: 'Destroyed worker successfully' }
        format.json { head :no_content }
      end
    end
  end

  private

  def set_worker
    return nil if !params[:id]

    @worker = Worker.find(params[:id])
  end 

  def worker_params
    params.require(:worker).permit(
      :first_name,
      :last_name,
      :pay,
      :sub_contractor_id
    )
  end
end
