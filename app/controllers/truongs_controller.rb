class TruongsController < ApplicationController
  # GET /truongs
  # GET /truongs.json
  def index
    #THUẬT TOÁN ZOOM MAP
    @truongs = Truong.paginate(:per_page => 9, :page => params[:page]).order('created_at DESC')
    @map=showmap(@truongs)


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @truongs }
    end
  end

  # GET /truongs/1
  # GET /truongs/1.json
  def show
    @truong = Truong.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @truong }
    end
  end

  # GET /truongs/new
  # GET /truongs/new.json
  def new
    @truong = Truong.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @truong }
    end
  end

  # GET /truongs/1/edit
  def edit
    @truong = Truong.find(params[:id])
  end

  # POST /truongs
  # POST /truongs.json
  def create
    @truong = Truong.new(params[:truong])

    respond_to do |format|
      if @truong.save
        format.html { redirect_to admin_truongs_url, notice: 'Truong was successfully created.' }
        format.json { render json: @truong, status: :created, location: @truong }
      else
        format.html { render action: "new" }
        format.json { render json: @truong.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /truongs/1
  # PUT /truongs/1.json
  def update
    @truong = Truong.find(params[:id])

    respond_to do |format|
      if @truong.update_attributes(params[:truong])
        format.html { redirect_to admin_truongs_url, notice: 'Truong was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @truong.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /truongs/1
  # DELETE /truongs/1.json
  def destroy
    @truong = Truong.find(params[:id])
    @truong.destroy

    respond_to do |format|
      format.html { redirect_to admin_truongs_url }
      format.json { head :no_content }
    end
  end
end
