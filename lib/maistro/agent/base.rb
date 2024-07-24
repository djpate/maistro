module Maistro
  module Agent
    class Base
      def initialize(name:)
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