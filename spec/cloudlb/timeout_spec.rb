require 'spec_helper'

module CloudLB
  describe Balancer do
    describe '#timeout' do
      before do
        response = Typhoeus::Response.new({ :code => 204, :headers => { 'X-Server-Management-Url' => 'x/1' } })
        Typhoeus.stub('https://auth.api.rackspacecloud.com/v1.0').and_return(response)
        response = Typhoeus::Response.new({ :code => 200, :body => '{"loadBalancer":{"connectionLogging":{}}}' })
        Typhoeus.stub(/loadbalancers/, { :method => :get }).and_return(response)
        c = CloudLB::Connection.new({:username => 'x', :api_key => 'y', :region => 'z'})
        @lb = CloudLB::Balancer.new(c, nil)
      end
      it 'exception on bad input' do
        expect { @lb.timeout = 'foo' }.to raise_error 'Must provide a new timout'
      end
      it 'exception on invalid timeout' do
        expect { @lb.timeout = 130 }.to raise_error 'Timout must be between 30 and 120'
      end
      it 'updates timeout' do
        response = Typhoeus::Response.new({ :code => 200, :body => '{"loadBalancer":{"connectionLogging":{}}}' })
        Typhoeus.stub(/loadbalancers/, { :method => :put, :body => '{"timeout":90}'}).and_return(response)
        expect { @lb.timeout = 90 }.to_not raise_error
      end
    end
  end
end
