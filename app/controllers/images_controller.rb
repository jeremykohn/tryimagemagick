class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @images = Image.all
    @image = Image.new
    logger.debug "* * * * * * * * * * image#new was called * * * * * * * * * * * "
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    # logger.debug "* * * * * * * * * * image#create was called * * * * * * * * * * * "

    @image = Image.new(image_params) # Creates uploaded file with id and options.
    
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image created.' }
        format.json { render action: 'show', status: :created, location: @image }
      else
        format.html { render action: 'new' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
    # logger.debug "* * * * * * new image saved * * * * * * *"

    # logger.debug "* * * * * * * * * * the image id is #{@image.id} * * * * * * * * * * * "
    
    dir = "public/uploads/pictures/#{@image.id}"
    input_file = "#{dir}/uploaded_image"
    output_file = "#{dir}/converted_image.jpg"
    
    # logger.debug "* * * * * * * * * * dir is #{dir} * * * * * * * * * * * "
    # logger.debug "* * * * * * * * * * location of original is #{input_file} * * * * * * * * * * * "
    # logger.debug "* * * * * * * * * * location of edited is #{output_file} * * * * * * * * * * * "
 
    options = @image.command
    
    # logger.debug "****** conversion by controller *******"
  
    @image.convert_single_image(input_file, options, output_file)
  
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update

    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:filename, :command, :location)
    end
end
