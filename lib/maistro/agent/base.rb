module Maistro
  module Agent
    class Base
      attr_accessor :thread, :name

      def initialize(name:, thread: [])
        @thread = thread
        @name = name
      end

      def discuss
        puts "type exit to leave"
        print 'you>'
        prompt = gets.chomp
        puts "#{@name}> #{interact(prompt)}"
        puts "here"
        while true
          print 'you>'
          prompt = gets.chomp
          break if prompt == 'exit'

          puts "#{@name}> #{interact(prompt)}"
        end
      end

      # used by the orchestrator to define the agent
      def definition
        <<~AGENT
          <agent>
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