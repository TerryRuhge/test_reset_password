class NdrsController < ApplicationController
  before_action :set_ndr, only: %i[ show edit update destroy ]
  helper_method :get_join_status
  # GET /ndrs or /ndrs.json
  def index
    @ndrs = Ndr.all
  end

  # GET /ndrs/1 or /ndrs/1.json
  def show
  end

  # GET /ndrs/new
  def new
    @ndr = Ndr.new
  end

  # GET /ndrs/1/edit
  def edit
  end

  # POST /ndrs or /ndrs.json
  def create
    @ndr = Ndr.new(ndr_params)
    @ndr.member_id = current_member
    respond_to do |format|
      if @ndr.save
        format.html { redirect_to ndr_url(@ndr), notice: "Ndr was successfully created." }
        format.json { render :show, status: :created, location: @ndr }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ndr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ndrs/1 or /ndrs/1.json
  def update
    respond_to do |format|
      if @ndr.update(ndr_params)
        format.html { redirect_to ndr_url(@ndr), notice: "Ndr was successfully updated." }
        format.json { render :show, status: :ok, location: @ndr }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ndr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ndrs/1 or /ndrs/1.json
  def destroy
    @ndr.destroy

    respond_to do |format|
      format.html { redirect_to ndrs_url, notice: "Ndr was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Detect if member has already signed up for ndr
  def get_join_status(test_ndr, test_member)
    return (Driver.find_by(ndr_id: test_ndr.ndr_id, member_id: test_member.member_id)).nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ndr
      @ndr = Ndr.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ndr_params
      params.require(:ndr).permit(:start_time, :end_time, :ndr_id, :is_active, :num_members_desired, :training_restrict, :dues_restrict)
    end
end
