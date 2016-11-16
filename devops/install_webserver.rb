require "docker"

container = Docker::Container.create(
      'Image' => 'myapp',
      'name' => 'myapp',
      'ExposedPorts' => { '80/tcp' => {} },
      'HostConfig' => {
        'PortBindings' => {
          '80/tcp' => [{ 'HostPort' => '8080' }]
        }
      }
    )
container.start