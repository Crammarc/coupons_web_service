class CouponTypesController < ApplicationController
  before_filter :oauth_authorized
  # GET /coupon_types
  # GET /coupon_types.json
  def index
    @coupon_types = CouponType.all

    respond_to do |format|
      format.html # index.html.erb
	  if @coupon_types
		#format.json { render json: @coupon_types }
		format.json { render :json => @coupon_types.to_a.to_json }
	  else
		format.json { render :json => "No Coupon Types Have Been Created Yet.\n", status: 603}
	  end
    end
  end

  # GET /coupon_types/1
  # GET /coupon_types/1.json
  def show  
	begin
		@coupon_type = CouponType.find(params[:id])
		
	rescue Mongoid::Errors::DocumentNotFound
		respond_to do |format|
			render text: "The Requested Coupon Type Does Not Exist.\n", status: 604
			#format.json { render :json => "The Requested Coupon Type Does Not Exist.\n", status: 604 }
		end
	else
		respond_to do |format|
			format.html # show.html.erb
			#format.json { render json: @coupon_type }
			format.json { render :json => @coupon_type.to_a.to_json }			
		end
	end
  end

  # GET /coupon_types/new
  # GET /coupon_types/new.json
  def new
    @coupon_type = CouponType.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @coupon_type }
	  format.json { render :json => @coupon_type.to_a.to_json }
    end
  end

  # GET /coupon_types/1/edit
  def edit
    @coupon_type = CouponType.find(params[:id])
  end

  # POST /coupon_types
  # POST /coupon_types.json
  def create
    @coupon_type = CouponType.new(params[:coupon_type])

    respond_to do |format|
      if @coupon_type.save
        format.html { redirect_to @coupon_type, notice: 'Coupon type successfully created.' }
        #format.json { render json: @coupon_type, status: :created, location: @coupon_type }
		format.json { render :json => "Coupon Type Successfully Created.\n" + @coupon_type.to_a.to_json, status: 600, location: @coupon_type }
      else
        format.html { render action: "new" }
		#format.json { render json: @coupon_type.errors, status: :unprocessable_entity }
        format.json { render :json => "Coupon Type Not Created.\n" + @coupon_type.to_a.to_json.errors, status: 601 }
      end
    end
  end

  # PUT /coupon_types/1
  # PUT /coupon_types/1.json
  def update
    @coupon_type = CouponType.find(params[:id])

    respond_to do |format|
      if @coupon_type.update_attributes(params[:coupon_type])
        format.html { redirect_to @coupon_type, notice: 'Coupon Type Successfully Updated.' }
        #format.json { head :no_content }
		format.json { render :json => "Coupon Type Successfully Updated.\n" + @coupon_type.to_a.to_json, status: 600, location: @coupon_type }
      else
        format.html { render action: "edit" }
        #format.json { render json: @coupon_type.errors, status: :unprocessable_entity }
		format.json { render :json => "Coupon Type Not Updated.\n" + @coupon_type.to_a.to_json.errors, status: 602 }
      end
    end
  end

  # DELETE /coupon_types/1
  # DELETE /coupon_types/1.json
  def destroy
    @coupon_type = CouponType.find(params[:id])
    @coupon_type.destroy

    respond_to do |format|
      format.html { redirect_to coupon_types_url }
      #format.json { head :no_content }
	  format.json { render :json => "Coupon Type Successfully Deleted.\n", status: 600 }
    end
  end
end
