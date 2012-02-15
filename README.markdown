## anyScp

anyScp is a simplified file transfer app that transfers files between any two remote machines using scp and a simple REST API.
It is a replacement for Multiplatform Managed file transfer products 

### Features

1. Multiplatform: FROM/TO Windows/Linux/Unix/AS400/AIX machines
1. RESTful API to create synchronized/async file transfer jobs
1. Post/Pre transfer hooks to execute custom jobs in remote machines
1. Logging all file transfers and failures
1. Manage remote host/user/passwords in one place

### anySCP Setup

1) Migrate and add hosts

<pre>$ rake db:migrate</pre>

2) Start Redis server

<pre>$ redis-server</pre>

3) Start Resque workers

<pre>$ QUEUE=file_transfer rake resque:setup resque:work</pre>
	
4) Start Resque webapp

<pre>$ resque-web</pre>

5) Start Rails app

<pre>$ unicorn_rails -p3000</pre>

6) Trigger file transfer using curl

<pre>$curl -X POST -d "source_host=host1&source_file=file1&dest_host=host2&dest_file=file2" http://localhost:3000/file_transfers.json </pre>


### TODO

1. Encrypt password
1. Sync file transfer
1. Mount Rack app for Resque webview
1. View all completed file transfers
1. API to SSH and execute remote jobs
1. Post transfer hook to invoke remote jobs

### DONE

1. Manage hosts
1. Setup Redis
1. Setup Resque workers
1. Async file transfer

### TODO - TEST

1. Windows SSH/SCP setup
2. Windows to Any file transfer
3. Any to Windows file transfer
1. AS400 SSH/SCP setup
2. AS400 to Any file transfer
3. Any to AS400 file transfer
1. Linux to Any file transfer
2. Any to Linux file transfer

### TESTED

1. Linux to Linux file transfer
1. AIX SSH/SCP setup
2. AIX to Any file transfer
3. Any to AIX file transfer
1. Linux to FTP file transfer
2. FTP to Linux file transfer
3. FTP to FTP file transfer

