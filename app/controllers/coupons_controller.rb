class CouponsController < ApplicationController
  # GET /coupons
  # GET /coupons.xml
  def index
    @coupons = Coupon.all

    respond_to do |format|
      format.html # index.html.erb
	  if @coupons
		#format.xml  { render :xml => @coupons }
		format.json { render :json => @coupons.to_a.to_json }
	  else
	    format.json { render :json => "No Coupons Have Been Created Yet.\n", status: 706}
	  end
    end
  end

  # GET /coupons/1
  # GET /coupons/1.xml
  def show
    @coupon = Coupon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
	  if @coupon
		#format.xml  { render :xml => @coupon }
		format.json { render :json => @coupon.to_a.to_json }
	  else
		format.json { render :json => "The Requested Coupon Does Not Exist.\n", status: 707}
	  end
    end
  end

  # GET /coupons/new
  # GET /coupons/new.xml
  def new
    @coupon = Coupon.new

    respond_to do |format|
      format.html # new.html.erb
      #format.xml  { render :xml => @coupon }
	  format.json { render :json => @coupon.to_a.to_json }
    end
  end

  # GET /coupons/1/edit
  def edit
    @coupon = Coupon.find(params[:id])
  end
  
  
  # POST /coupons
  # POST /coupons.json
  def create
    @coupon = Coupon.new(params[:coupon])

	#Case 1: The Requested Coupon Type Does Not Exist
	begin
		@coupon_type = CouponType.find(params[:coupon][:coupon_type_id])
		
	rescue Mongoid::Errors::DocumentNotFound
		flash[:notice] = 'The Requested Coupon Type Does Not Exist'
		#render action: "new"
		render text: "The Requested Coupon Type Does Not Exist.", status: 701
		return
	end
	
	#Case 2: The Requested Coupon Has Expired
	if @coupon_type.expiration_date < Time.now
		flash[:notice] = 'The Requested Coupon Has Expired'
		#render action: "new"
		render text: "The Requested Coupon Has Expired.", status: 702
		return
	end
	
	@coupon.update_attributes(:created_at => Time.now);
	@coupon.update_attributes(:used_date => nil);
	
    respond_to do |format|
      if @coupon.save
        format.html { redirect_to @coupon, notice: 'Coupon Successfully Generated.' }
        #format.json { render json: @coupon.to_a.to_json, status: :created, location: @coupon.to_a.to_json }
		format.json { render :json => "Coupon Successfully Generated.\n" + @coupon.to_a.to_json, status: 700, location: @coupon }
      else
        format.html { render action: "new" }
        #format.json { render json: @coupon.to_a.to_json.errors, status: :unprocessable_entity }
		format.json { render :json => "Coupon Not Generated.\n" + @coupon.to_a.to_json.errors, status: 703}
      end
    end
  end
  

  # PUT /coupons/1
  # PUT /coupons/1.xml
  def update
    @coupon = Coupon.find(params[:id])
	
	@coupon_type = CouponType.find(@coupon.coupon_type_id)
	
	#Case 1: The Requested Coupon Has Expired
	if @coupon_type.expiration_date < Time.now
		#flash[:notice] = 'The Requested Coupon Has Expired'
		#render action: "new"
		render text: "The Requested Coupon Has Expired.", status: 704
		return
	end
	
	#Case 2: The Requested Is Not Valid
	if @coupon.used_date != nil
		flash[:notice] = 'The Requested Coupon Is Not Valid'
		#render action: "new"
		render text: "The Requested Coupon Is Not Valid.", status: 705
		return
	end
	
	@coupon.update_attributes(:used_date => Time.now, :consuming_partner => params[:coupon][:consuming_partner]);
	
    respond_to do |format|
      if @coupon.update_attributes(params[:coupon])
        format.html { redirect_to(@coupon, :notice => 'The Coupon Was Successfully Validated.') }
        #format.xml  { head :ok }
		#format.json { render text: "Your Coupon Was Correctly Validated.", status: 200}
		#format.json { render json: @coupon, status: "Your Coupon Was Correctly Validated." }
		format.json { render :json => "Coupon Successfully Validated.\n" + @coupon.to_a.to_json, status: 700, location: @coupon }
      else
        format.html { render :action => "edit" }
        #format.xml  { render :xml => @coupon.errors, :status => :unprocessable_entity }
		format.json { render :json => "Coupon Not Updated.\n" + @coupon.to_a.to_json.errors, status: 706}
      end
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.xml
  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy

    respond_to do |format|
      format.html { redirect_to(coupons_url) }
      #format.xml  { head :ok }
	  #format.json { head :no_content }
	  format.json { render :json => "Coupon Successfully Deleted.\n", status: 700 }
    end
  end
end
