module CardConnect
  module Service
    class VoidRequest
      include Utils

      REQUIRED_FIELDS = [:merchid, :retref]

      OPTIONAL_FIELDS = [:amount]

      FIELDS = REQUIRED_FIELDS + OPTIONAL_FIELDS

      attr_accessor *FIELDS
      attr_reader :errors

      # Initializes a new Void Request
      #
      # @param attrs [Hash]
      # @return CardConnect::VoidRequest
      def initialize(attrs = {})
        @errors = []
        set_attributes(attrs, FIELDS)
        validate_required_fields
      end

      # Indicates that the request is valid once it is built.
      def valid?
        errors.empty?
      end

      # Builds the request payload
      def payload
        payload = {}
        FIELDS.each do |field|
          payload.merge!({field => send(field)})
        end
        payload
      end

      private

      def validate_required_fields
        REQUIRED_FIELDS.each do |field|
          value = send(field)
          value.nil? || value.empty? ? errors.push("#{field.capitalize} is missing") : next
        end
      end

    end
  end
end