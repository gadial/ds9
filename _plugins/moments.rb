require 'yaml'
module Jekyll
  class MomentsTag < Liquid::Block

    def initialize(tag_name, text, tokens)
        super
        @text = text
    end

    def render(context)
      text = super
      moments_list = YAML.load(text.gsub('"', '\"'))
      image_dir = "#{context.registers[:site].baseurl}/assets/img/reviews/S0#{context.registers[:page]['season']}_Summary"
      content = moments_list.map.with_index do |moment, index|
        {
          'number' => moments_list.length - index,
          'text' => moment[0].gsub('\"', '"'),
          'episode' => moment[1],
          'explain'=> moment[2].gsub('\"', '"'),
          'image' => "#{image_dir}/M#{index+1}.jpg"
        }
      end      
      moments_template = File.read("_includes/moments.html")
      Liquid::Template.parse(moments_template).render ({"moments" => content})
    end
  end
end

Liquid::Template.register_tag('moments', Jekyll::MomentsTag)