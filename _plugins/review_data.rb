module Jekyll
    class ReviewDataSet < Generator
      def generate(site)
        site.collections['reviews'].docs.each do |post|
            season = post.data['season']
            name = post.data['name'].gsub(" ", "_")
            if post.data.key? 'episode'
                episode = post.data['episode']
                if episode.to_s.index("-").nil?
                    episode_string = "%02d" % episode
                else
                    if episode.length == 3
                        episode_string = "0" + episode
                    else
                        episode_string = episode
                    end
                end
                post.data['permalink'] = "/S#{"%02d" % season}/E#{episode_string}/#{name}"
            else
                post.data['permalink'] = "/S#{"%02d" % season}/#{name}"
            end
         end
       end
    end
end