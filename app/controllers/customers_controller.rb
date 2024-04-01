class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]

  # GET /customers or /customers.json
  def index
    @counter = Customer.count
    @pagy, @customers = pagy(Customer.all.order(id: :desc))

    if params[:query_text].present?
      @pagy, @customers = pagy(Customer.search_full_text(params[:query_text]))
    end
    #render layout: 'customers'
  end

  # GET /customers/1 or /customers/1.json
  def show
    @counter = 1
    #render layout: 'customers'
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    #render layout: 'customers'
  end

  # GET /customers/1/edit
  def edit
    #render layout: 'customers'
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customer_url(@customer), notice: "Cliente creado exitosamente :)" }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customer_url(@customer), notice: "Cliente actualizado con éxito :)" }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.movies.delete_all #Elimina la relación con la pelicula y al cliente
    @customer.destroy #Elimina todo todillo

    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Cliente eliminado exitosamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:name, :age)
    end
end
