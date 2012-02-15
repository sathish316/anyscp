require 'net/scp'
require 'net/ftp'

class FileTransfer
  @queue = :file_transfer
  TMP_LOCATION = '/tmp'
  
  FTP = 'ftp'
  SCP = 'scp'
  
  def self.perform(source_hostname, source_file, dest_hostname, dest_file, source_mode, dest_mode)
    puts "Performing file transfer from #{source_hostname}:#{source_file} to #{dest_hostname}:#{dest_file}"

    source_host = Host.find_by_hostname(source_hostname)
    puts "Source host #{source_hostname} not found" and return unless source_host
    
    dest_host = Host.find_by_hostname(dest_hostname)
    puts "Destination host #{dest_hostname} not found" and return unless dest_host

    temp_filename = "#{TMP_LOCATION}/#{File.basename(source_file)}"
    
    # download source_file from source_host
    if source_mode == FTP
      puts "ftp #{source_host.username}@#{source_host.ip}:#{source_file} #{temp_filename}"
      Net::FTP.open(source_host.ip) do |ftp|
        ftp.login(source_host.username, source_host.password)
        ftp.chdir(File.dirname(source_file))
        ftp.getbinaryfile(File.basename(source_file), temp_filename)
      end
    else
      puts "scp #{source_host.username}@#{source_host.ip}:#{source_file} #{temp_filename}"
      Net::SCP.start(source_host.ip, source_host.username, :password => source_host.password) do |scp|
        scp.download!(source_file, temp_filename)
      end
    end
    
    # upload source_file to dest_host
    if dest_mode == FTP
      puts "ftp #{temp_filename} #{dest_host.username}@#{dest_host.ip}:#{dest_file}"
      Net::FTP.open(dest_host.ip) do |ftp|
        ftp.login(dest_host.username, dest_host.password)
        ftp.chdir(File.dirname(dest_file))
        ftp.putbinaryfile(temp_filename, File.basename(dest_file))
      end
    else
      puts "scp #{temp_filename} #{dest_host.username}@#{dest_host.ip}:#{dest_file}"
      Net::SCP.start(dest_host.ip, dest_host.username, :password => dest_host.password) do |scp|
        scp.upload!(temp_filename, dest_file)
      end
    end
  end
end