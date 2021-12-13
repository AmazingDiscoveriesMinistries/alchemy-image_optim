module Alchemy::PictureExtension
  def self.prepended(base)
    base.send(:dragonfly_accessor, :image_file, app: :alchemy_pictures) do
      # Using ImageOptim for optimization
      after_assign { |a| a.process!(:optimize) }
    end
  end
end

Alchemy::Picture.prepend(Alchemy::PictureExtension)
