require "docker"

container = Docker::Container.get('myapp')
container.stop
container.delete

`docker rmi myapp`
