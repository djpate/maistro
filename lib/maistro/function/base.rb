module Maistro
  module Function
    class Base
      def name
        raise NotImplementedError
      end

      def description
        raise NotImplementedError
      end

      def parameters
        raise NotImplementedError
      end

      def run
        raise NotImplementedError
      end
    end
  end
end