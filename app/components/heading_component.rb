class HeadingComponent < ApplicationComponent
  attr_reader :title, :tag

  def initialize(title:, tag: :h1)
    @title = title
    @tag = tag
  end

  def tag_classes
    case tag
    when :h1
      "Heading--h1"
    when :h2
      "text-xl mb-2"
      
    end
  end
end
