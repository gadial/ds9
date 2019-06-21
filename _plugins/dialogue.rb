module Jekyll
  class DialogueTag < Liquid::Block

	def initialize(tag_name, text, tokens)
      super
      @text = text
    end
	
    def render(context)
      text = super
	  dialogue = text.split("\n").map{|line| "<p>#{line}</p>"}
	  "<div dir=\"ltr\">#{dialogue}</div>"
    end
  end
end

Liquid::Template.register_tag('dialogue', Jekyll::DialogueTag)