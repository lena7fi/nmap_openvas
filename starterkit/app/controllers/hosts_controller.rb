class HostsController < ApplicationController
  def initialize
    super
    # Include the main layout bootstrap file
    require_relative "../views/#{Rails.configuration.settings.KT_THEME_LAYOUT_DIR}/_bootstrap/default"

    # Initialize the main layout bootstrap class
    KTBootstrapDefault.new.init(helpers)
  end

  def index
    @hosts = Host.all
    render "pages/hosts/index"
  end

  def show
    host = Host.find(params[:id])
    @nmap_result = `nmap #{host.address}`
    render "pages/hosts/details"
  end

  def new
    @host = Host.new
    render "pages/hosts/new"
  end

  def create
    @host = Host.new(params.require(:host).permit(:address))
    @nmap_result = `nmap #{@host.address}`
    if @host.save
      redirect_to @host
    else
      render "pages/hosts/new", status: :unprocessable_entity
    end
  end
end
