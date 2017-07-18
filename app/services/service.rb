module Service
  extend ActiveSupport::Concern

  included do
    attr_reader :options

    def initialize(options = {})
      @options = JSON.parse(options.to_json, object_class: OpenStruct)
    end
  end

  class_methods do
    def call(options = {})
      new(options).call
    end
  end
end
