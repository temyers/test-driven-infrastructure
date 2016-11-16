require "serverspec"
require "docker"

describe "I am logged onto the webserver" do
  container = nil
  
  # This is a demo!
  # In reality our webserver would be running somewhere else
  before(:all) do
    #container = Docker::Container.create(
    #  'Image' => 'myapp',
    #  'ExposedPorts' => { '80/tcp' => {} },
    #  'HostConfig' => {
    #    'PortBindings' => {
    #      '80/tcp' => [{ 'HostPort' => '8080' }]
    #    }
    #  }
    #)
    #container.start
    set :backend, :exec
  end
  
  #after(:all) do
  #  container.stop
  #end
  
  describe "MyApp" do
  
    describe docker_container('myapp') do
      it { should be_running }
    end
    
  
    describe port(8080) do
      it { should be_listening }
    end
  
    describe command("curl http://localhost:8080") do
      its(:stdout) { should match /Hello CukeUp Australia/ }    
    end
    
  end
  
  describe "Routing" do
    describe "Internet connectivity is enabled" do
      describe host('8.8.8.8') do
        it { should be_reachable.with( :port => 53 ) }
      end     
      describe host('www.google.com') do
        it { should be_reachable.with( :port => 443 ) }
      end     
    end
  end

end