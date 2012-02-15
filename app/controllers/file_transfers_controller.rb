class FileTransfersController < ApplicationController

  def create
    Resque.enqueue(FileTransfer, params[:source_host], params[:source_file], 
                                 params[:dest_host], params[:dest_file],
                                 params[:source_mode] || FileTransfer::SCP,
                                 params[:dest_mode] || FileTransfer::SCP,)
    respond_to do |format|
      format.json  { head :ok }
    end
  end
end
