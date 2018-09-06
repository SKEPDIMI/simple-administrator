class PermissionCodesController < ApplicationController
  before_action :set_permission_code, only: [:show, :edit, :update, :destroy]

  # GET /permission_codes
  # GET /permission_codes.json
  def index
    @permission_codes = PermissionCode.all
  end

  # GET /permission_codes/1
  # GET /permission_codes/1.json
  def show
  end

  # GET /permission_codes/new
  def new
    @permission_code = PermissionCode.new
  end

  # GET /permission_codes/1/edit
  def edit
  end

  # POST /permission_codes
  # POST /permission_codes.json
  def create
    @permission_code = PermissionCode.new(permission_code_params)

    respond_to do |format|
      if @permission_code.save
        format.html { redirect_to @permission_code, notice: 'Permission code was successfully created.' }
        format.json { render :show, status: :created, location: @permission_code }
      else
        format.html { render :new }
        format.json { render json: @permission_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permission_codes/1
  # PATCH/PUT /permission_codes/1.json
  def update
    respond_to do |format|
      if @permission_code.update(permission_code_params)
        format.html { redirect_to @permission_code, notice: 'Permission code was successfully updated.' }
        format.json { render :show, status: :ok, location: @permission_code }
      else
        format.html { render :edit }
        format.json { render json: @permission_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permission_codes/1
  # DELETE /permission_codes/1.json
  def destroy
    @permission_code.destroy
    respond_to do |format|
      format.html { redirect_to permission_codes_url, notice: 'Permission code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission_code
      @permission_code = PermissionCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permission_code_params
      params.require(:permission_code).permit(:body, :role)
    end
end
