class HostsController < ApplicationController
  # GET /hosts
  def index
    @hosts = Host.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /hosts/1
  def show
    @host = Host.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /hosts/new
  def new
    @host = Host.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /hosts/1/edit
  def edit
    @host = Host.find(params[:id])
  end

  # POST /hosts
  def create
    @host = Host.new(params[:host])

    respond_to do |format|
      if @host.save
        format.html { redirect_to(@host, :notice => 'Host was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /hosts/1
  def update
    @host = Host.find(params[:id])

    respond_to do |format|
      if @host.update_attributes(params[:host])
        format.html { redirect_to(@host, :notice => 'Host was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /hosts/1
  def destroy
    @host = Host.find(params[:id])
    @host.destroy

    respond_to do |format|
      format.html { redirect_to(hosts_url) }
    end
  end
end
