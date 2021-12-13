Alchemy::Picture.class_eval do
  dragonfly_accessor :image_file, app: :alchemy_pictures do
    # Using ImageOptim for optimization
    after_assign { |a| a.process!(:optimize) }
  end
end
