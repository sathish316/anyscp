class FileTransfer
  @queue = :file_transfer
  
  def self.perform(source_host, source_file, dest_host, dest_file)
    puts "TODO: scp user@#{source_host}:#{source_file} user@#{dest_host}:#{dest_file}"
  end
end
