module Maistro
  module Agent
    class Base
      attr_accessor :thread, :name, :default

      def initialize(name:, thread: [], default: false)
        @thread = thread
        @name = name
        @default = default
      end

      # used by the orchestrator to define the agent
      def definition
        <<~AGENT
          <agent default="#{default}">
            <name>#{name}</name>
            <role>#{role}</role>
          </agent>
        AGENT
      end

      def interact(prompt)
        raise NotImplementedError
      end

      def role
        raise NotImplementedError
      end

      def prompt
        raise NotImplementedError
      end

      def functions
        raise NotImplementedError
      end

      def documents
        raise NotImplementedError
      end
    end
  end
end