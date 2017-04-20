Test Driven Infrastructure
=========================

Simple demo application to show Test Driven Infrastructure in action using Serverspec.

`vagrant up`

Running Tests
=============

`rspec spec/myapp_container_spec.rb`

`rspec spec/webserver_spec.rb`

DevOps on local machine
==================================
Build:
`devops/build_container.sh`

Create:
`ruby devops/install_webserver.rb`

Destroy:
`ruby devops/cleanup_webserver.rb`


Putting it all together
=======================
Checkout the repository

run the test - `rspec spec/myapp_container_spec.rb`

Note there are 2 failures

Edit the Dockerfile:

Change
```
FROM ubuntu:16.04
#FROM httpd:2.4
```
to:
```
#FROM ubuntu:16.04
FROM httpd:2.4
```

Re-run the test: `rspec spec/myapp_container_spec.rb`

There is now 1 failure

Edit the Dockerfile:

Uncomment: `COPY ./app/html /usr/local/apache2/htdocs/`

Re-run the test: `rspec spec/myapp_container_spec.rb`

THE TESTS SHOULD PASS!

Run the webserver tests: `rspec spec/webserver_spec.rb`

There should be 2 passing tests, 2 failures (if you have internet connectivity)

Build your container: `./devops/build_container.sh`

Install your webserver: `ruby devops/install_webserver.rb`

Rerun your tests: `rspec spec/webserver_spec.rb`

THE TESTS SHOULD PASS.

Clean up: `ruby devops/cleanup_webserver.rb``
