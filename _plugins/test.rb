text = "\nODO: I'll never understand the humanoid need to couple. \nQUARK: You've never coupled? \nODO: Choose not to. Too many compromises. You want to watch the karo-net tournament, she wants to listen to music, so you compromise. You listen to music. You like Earth jazz, she prefers Klingon opera, so you compromise. You listen to Klingon opera. So here you were ready to have a nice night watching the karo-net match and you wind up spending an agonising night listening to Klingon opera. \n"

def generate_dialogue_line(raw_line)
    raw_line =~ /(\w+): (.*)/
    {
        'speaker_name' => $1,
        'speaker_image' => "/ds9/assets/img/dialogue/#{$1}.jpg",
        'text' => $2,
    }
end

# require 'liquid'

# lines = text.strip.split("\n").map{|line| generate_dialogue_line(line)}
# dialogue_template = File.read("../_includes/dialogue.html")
# context = {'lines' => lines}
# result = Liquid::Template.parse(src).render context
# puts result