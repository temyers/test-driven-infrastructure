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

Create:
`ruby devops/install_webserver.rb`

Destroy:
`ruby devops/cleanup_webserver.rb`