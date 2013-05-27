class BannersController < ApplicationController


	load_and_authorize_resource
  # GET /banners
  # GET /banners.json
  def index
    @banners = Banner.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @banners }
    end
  end

  # GET /banners/1
  # GET /banners/1.json
  def show
    @banner = Banner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @banner }
    end
  end

  # GET /banners/new
  # GET /banners/new.json
  def new
    @banner = Banner.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @banner }
    end
  end

  # GET /banners/1/edit
  def edit
    @banner = Banner.find(params[:id])
  end

  # POST /banners
  # POST /banners.json
  def create
    @banner = Banner.new(params[:banner])

    respond_to do |format|
      if @banner.save
				if @banner.disabled?
					notice = t("banner.created_but_disabled")
				else
					notice = t("banner.created_and_enabled")
				end
        format.html { redirect_to @banner, notice: notice }
        format.json { render json: @banner, status: :created, location: @banner }
      else
        format.html { render action: "new" }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /banners/1
  # PUT /banners/1.json
  def update
    @banner = Banner.find(params[:id])

    respond_to do |format|
      if @banner.update_attributes(params[:banner])

				notice_message = t('banner.updated')

				if params[:banner].count == 1
					notice_message = t("banner.disabled", :link => banner_path(@banner), :title => @banner.title) if params[:banner][:disabled] == true 
					notice_message = t("banner.enabled", :link => banner_path(@banner), :title => @banner.title) if params[:banner][:disabled] == false 
				end

				redirect_path = request.env["HTTP_REFERER"]
				redirect_path = banner_path(@banner) if request.env["HTTP_REFERER"]==edit_banner_url(@banner) 

        format.html { redirect_to redirect_path, notice: notice_message }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banners/1
  # DELETE /banners/1.json
  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy

    respond_to do |format|
      format.html { redirect_to banners_url }
      format.json { head :no_content }
    end
  end
end
