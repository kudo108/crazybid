class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    if params[:product].has_key?(:datafile)
      if params[:product][:datafile]!=""
      #self.update(params[:product])
      require 'fileutils'
        tmp = params[:product][:datafile].tempfile
        file = File.join("app/assets/images",params[:product][:datafile].original_filename)
        FileUtils.cp tmp.path, file
        params[:product][:product_image] = params[:product][:datafile].original_filename;
        params[:product].delete :datafile 
      end
    end
    @product = Product.new(params[:product])
    
    respond_to do |format|
      if @product.save(params[:product])
        format.html { redirect_to "/admin/?act=show&id=#{@product.id}", notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { redirect_to "/admin/?act=new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    if params[:product].has_key?(:datafile)
      if params[:product][:datafile]!=""
      #self.update(params[:product])
      require 'fileutils'
        tmp = params[:product][:datafile].tempfile
        file = File.join("app/assets/images",params[:product][:datafile].original_filename)
        FileUtils.cp tmp.path, file
        params[:product][:product_image] = params[:product][:datafile].original_filename;
        params[:product].delete :datafile 
      end
    end
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to "/admin/?act=show&id=#{@product.id}", notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html {redirect_to "/admin/?act=edit&id=#{@product.id}" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to '/admin/' }
      format.json { head :no_content }
    end
  end
end
