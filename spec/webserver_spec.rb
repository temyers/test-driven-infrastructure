require "serverspec"
require "docker"

describe "I am logged onto the webserver" do
  container = nil
  
  before(:all) do
    set :backend, :exec
  end
  
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