module Jekyll
    class Document
      def url=(name)
        @url = name
      end
    end
end

module Jekyll
    class ReviewDataSet < Generator
        def formatted_episode_string(episode_string)
            return "%02d" % episode_string if episode_string.to_s.index("-").nil?
            return "0" + episode_string if episode_string.length == 3
            return episode_string
        end

        def generate(site)
            site.data['seasons'] = Hash.new{|h,k| h[k] = [] }
            site.collections['reviews'].docs.each do |post|
                season = post.data['season']
                next if season.nil?
                name = post.data['name'].gsub(" ", "_").gsub(".", "").gsub("?", "")
                post.data['permalink'] = "/S#{"%02d" % season}#{'/E' + formatted_episode_string(post.data['episode']) if post.data.key? 'episode'}/#{name}"
                post.url = post.data['permalink']
                site.data['seasons'][season] << post
            end
        end
    end
end