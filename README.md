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


# Running in Docker
If you're running inside a Docker container, and using sibling containers for running my app:

```
# docker ps
CONTAINER ID        IMAGE                      COMMAND              CREATED             STATUS              PORTS                  NAMES
874a13f65926        myapp                      "httpd-foreground"   2 minutes ago       Up 2 minutes        0.0.0.0:8080->80/tcp   myapp
034a8606b4b0        myproject-dev-env:latest   "bash"               28 minutes ago      Up 28 minutes                              testdriveninfrastructurecukeup_dev-env_run_1
```

```
# docker network ls
NETWORK ID          NAME                                      DRIVER              SCOPE
...
76a9193ca4b4        testdriveninfrastructurecukeup_default    bridge              local
```

```
# docker network connect 76a9193ca4b4 874a13f65926
```
