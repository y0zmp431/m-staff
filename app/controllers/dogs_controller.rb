class DogsController < ApplicationController
	load_and_authorize_resource :find_by => :url
  # GET /dogs
  # GET /dogs.json
  def index
    @dogs = Dog.find_with_params params

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dogs }
    end
  end

  # GET /dogs/1
  # GET /dogs/1.json
  def show
    @dog = Dog.find_by_url(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dog }
    end
  end

  # GET /dogs/new
  # GET /dogs/new.json
  def new
    @dog = Dog.new
    if last_sort_index = Dog.unscoped.order('sort_index ASC').pluck(:sort_index).last
      @dog.sort_index = last_sort_index + 10
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dog }
    end
  end

  # GET /dogs/1/edit
  def edit
    @dog = Dog.find_by_url(params[:id])
  end

  # POST /dogs
  # POST /dogs.json
  def create
    @dog = Dog.new(params[:dog])


    respond_to do |format|
      if @dog.save
				if params[:images]
					params[:images].each { |image|
						@dog.photos.create(image: image)
					}
				end
        format.html { redirect_to @dog, notice: t('Dog was successfully created.', :dog_name => @dog.name )}
        format.json { render json: @dog, status: :created, location: @dog }
      else
        format.html { render action: "new" }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dogs/1
  # PUT /dogs/1.json
  def update
    @dog = Dog.find_by_url(params[:id])

    respond_to do |format|
      if @dog.update_attributes(params[:dog])
				if params[:images]
					params[:images].each { |image|
						@dog.photos.create(image: image)
					}
				end
        format.html { redirect_to @dog, notice: 'Dog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1
  # DELETE /dogs/1.json
  def destroy
    @dog = Dog.find_by_url(params[:id])
    @dog.destroy

    respond_to do |format|
      format.html { redirect_to dogs_url }
      format.json { head :no_content }
    end
  end
end
