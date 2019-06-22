module Jekyll
  class DialogueTag < Liquid::Block

    def initialize(tag_name, text, tokens)
        super
        @text = text
    end

    def generate_dialogue_line(raw_line)
        raw_line =~ /([^:]*): (.*)/
        {
            'speaker_name' => $1,
            'speaker_image' => "/ds9/assets/img/dialogue/#{$1}.jpg",
            'text' => $2,
        }
    end

    def render(context)
      text = super
      lines = text.strip.split("\n").map{|line| generate_dialogue_line(line)}
      dialogue_template = File.read("_includes/dialogue.html")
      content = {'lines' => lines}
      Liquid::Template.parse(dialogue_template).render content
    end
  end
end

Liquid::Template.register_tag('dialogue', Jekyll::DialogueTag)