class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_users, only: [:new, :create, :edit, :update]
  # GET /jobs
  # GET /jobs.json
  def index
    # make sure we can view jobs when delivering them
    @jobs = (Job.all).reject{|j| !current_user_has_low_permission_for_job(j)}
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    
    # the project manager chosen by admin creating this job ... OR
    project_manager_provided = params[:job][:project_manager_id] if current_user_is_admin
    # ... the project manager creating this job
    automatic_project_manager = current_user if current_user_is_project_manager

    if project_manager_provided
      @job.project_manager_id = project_manager_provided
    elsif automatic_project_manager
      @job.project_manager_id = automatic_project_manager.id
    end

    superintendent_exists = User.exists?(@job.superintendent_id)

    respond_to do |format|
      if current_user_has_high_permission_for_job and superintendent_exists
        if @job.save
          puts @job
          format.html { redirect_to @job, notice: 'Job was successfully created.' }
          format.json { render :show, status: :created, location: @job }
        else
          format.html { render :new }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      elsif !superintendent_exists
        @job.errors.add(:_, 'This superintendent does not exist')

        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      elsif !current_user_has_high_permission_for_job
        @job.errors.add(:_, 'You dont have permission to create a job')

        format.html { render :new }
        format.json { render json: @job.errors, status: :unauthorized }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      return nil if !params[:id]

      @job = Job.find(params[:id])

      if we_have_permission_for_job?(@job)
        return @job
      else
        return nil
      end
    end

    def set_users
      @superintendents = Array(User.where(role: 3))
      @project_managers = Array(User.where(role: 2))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(
        :title,
        :superintendent_id,
        :start_date,
        :end_date
      )
    end
end
