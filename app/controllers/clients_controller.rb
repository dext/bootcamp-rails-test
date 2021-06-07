class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def show
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to @client
    else
      render :new
    end
  end

  def edit
  end

  def delete
  end

  private
    def client_params
      params.require(:client).permit(:name, :provider, :business_type).merge(user_id: current_user.id)
    end
end