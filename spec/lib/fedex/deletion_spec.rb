require 'spec_helper'

module Fedex
  module Request
    describe Deletion do
      describe '.new' do
        let(:tracking_number) { '1234567890' }

        it 'should be instantiable' do
          deletion = Deletion.new(fedex_credentials, tracking_number: tracking_number)
        end
      end
    end
  end
end
