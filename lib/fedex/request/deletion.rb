require 'fedex/request/base'

module Fedex
  module Request
    class Deletion < Base
      attr_reader :response_details

      def initialize(credentials, options={})
        requires! options, :tracking_number
        @credentials = credentials
        @tracking_number = options[:tracking_number]

        @debug = options[:debug] || ENV['DEBUG'] == 'true'
      end

      # Sends post request to Fedex web service and parse the response.
      def process_request
        api_response = self.class.post api_url, body: build_xml
        puts api_response if @debug
        response = parse_response(api_response)
        if success?(response)
          success_response(api_response, response)
        else
          failure_response(api_response, response)
        end
      end

      private

      def service
        { id: 'ship', version: Fedex::API_VERSION }
      end

      def add_deletion_detail xml
        xml.TrackingId {
          xml.TrackingIdType 'FEDEX'
          xml.TrackingNumber @tracking_number
        }
        xml.DeletionControl 'DELETE_ALL_PACKAGES'
      end

      # Callback used after a failed shipment response.
      def failure_response(api_response, response)
        error_message = if response[:shipment_reply]
          [response[:shipment_reply][:notifications]].flatten.first[:message]
        else
          "#{api_response["Fault"]["detail"]["fault"]["reason"]}\n--#{api_response["Fault"]["detail"]["fault"]["details"]["ValidationFailureDetail"]["message"].join("\n--")}"
        end rescue $1
        raise RateError, error_message
      end

      # Callback used after a successful shipment response.
      def success_response(api_response, response)
        @response_details = response[:shipment_reply]
      end

      # Build xml Fedex Web Service request
      def build_xml
        builder = Nokogiri::XML::Builder.new do |xml|
          xml.DeleteShipmentRequest(xmlns: "http://fedex.com/ws/ship/v#{service[:version]}"){
            add_web_authentication_detail xml
            add_client_detail xml
            add_version xml
            xml.ShipTimestamp Time.now.utc.iso8601(2)
            add_deletion_detail xml
          }
        end
        builder.doc.root.to_xml
      end

      # Successful request
      def success?(response)
        response[:shipment_reply] &&
          %w{SUCCESS WARNING NOTE}.include?(response[:shipment_reply][:highest_severity])
      end

    end
  end
end
