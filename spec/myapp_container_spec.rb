require "serverspec"
require "docker-api"

describe "MyApp Container" do
  before(:all) do
    image = Docker::Image.build_from_dir('.')

    set :os, family: :debian
    set :backend, :docker
    set :docker_image, image.id
  end

  describe "installed Apps" do

    describe "Apache HTTP" do
      describe process("httpd") do
        it { should be_running }
      end

      it "should have copied my app files" do
        expect(file('/usr/local/apache2/htdocs/index.html').content).to match /Hello World/
      end

    end
  end

end
