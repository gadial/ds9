module Jekyll
    class WithinCollectionPostNavigation < Generator
      def generate(site)
        site.collections.each do |key, collection|
          posts = collection.docs
          posts.sort! { |a,b| a <=> b}
          posts.each.with_index do |post, index|
            if index < posts.length - 1
              post.data["next_in_collection"] = posts[index + 1]
            end
            if index > 0
              post.data["previous_in_collection"] = posts[index - 1]
            end
          end
        end
      end
    end
  end