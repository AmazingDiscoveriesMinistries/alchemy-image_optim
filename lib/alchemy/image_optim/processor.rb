module Alchemy
  module ImageOptim
    class Processor
      def call(content)
        begin
          io = ::ImageOptim.new
          optimized = io.optimize_image(content.path)
          content.update(File.new(optimized.to_path)) unless optimized.nil?
        rescue => e
          if Alchemy::ImageOptim.configuration.raise_errors
            raise e
          else
            Logger.warn(e, caller.first)
            content
          end
        end
      end
    end

  end
end
