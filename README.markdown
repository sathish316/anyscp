## AnySCP

AnySCP is a simplified Managed File Transfer app that executes and tracks File transfers between any two remote machines using plain SCP.
It is a replacement for multiplatform $$$ file transform products with the following features:

1. Multiplatform: FROM/TO Windows/Linux/Unix/AS400/AIX machines
1. RESTful API to create synchronized/async file transfer jobs
1. Post/Pre transfer hooks to execute custom jobs in remote machines
1. Logging all file transfers
1. Manage remote host/user/passwords in one place

### SETUP

1. Migrate and add hosts

<pre>$ rake db:migrate</pre>

2. Start Redis server

<pre>$ redis-server</pre>

3. Start Resque workers

<pre>$ QUEUE=file_transfer rake resque:setup resque:work</pre>
	
4. Start Resque webapp

<pre>$ resque-web</pre>

5. Start Rails app

<pre>$ unicorn_rails</pre>

6. Trigger file transfer using curl

<pre>$curl -X POST -d "source_host=host1&source_file=file1&dest_host=host2&dest_file=file2" http://localhost:3000/file_transfers.json </pre>

### DONE

1. Hosts: Hostname,IP,user,password management (stored in Sqlite db)
1. Setup Redis
1. FileTransfer: Async file transfer (using Resque)
1. Setup Resque workers
1. Resque webview

### TODO

1. Encrypt password
1. FileTransfer: API for sync file transfer (stored in Redis)
1. Mount Rack app for Resque webview
1. View all file transfers
1. API to SSH and execute remote jobs
1. Post transfer hook to invoke above API

### TESTED

### TODO - TEST

1. Linux to Linux file transfer
1. Windows SSH/SCP setup
2. Windows to Any file transfer
3. Any to Windows file transfer
1. AIX SSH/SCP setup
2. AIX to Any file transfer
3. Any to AIX file transfer
1. AS400 SSH/SCP setup
2. AS400 to Any file transfer
3. Any to AS400 file transfer
1. Linux to Any file transfer
2. Any to Linux file transfer


