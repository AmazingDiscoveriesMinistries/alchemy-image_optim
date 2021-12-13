module Alchemy
  module ImageOptim
    class Processor
      def call(temp_object)
        begin
          io = ::ImageOptim.new
          optimized = io.optimize_image(temp_object.path)
          optimized.nil? ? temp_object : File.new(optimized.to_path)
        rescue => e
          if Alchemy::ImageOptim.configuration.raise_errors
            raise e
          else
            Logger.warn(e, caller.first)
            temp_object
          end
        end
      end
    end

  end
end
