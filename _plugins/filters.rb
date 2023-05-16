module Jekyll
    module EventFilters

        def coming_events(posts)
            posts.select do |post|
                end_date = post.data['to'] ? post.data['to'] : post.data['from']
                if end_date.to_s[0..9] >= DateTime.now.strftime("%Y-%m-%d")
                    post
                end
            end
        end

        def past_events(posts)
            posts.select do |post|
                end_date = post.data['to'] ? post.data['to'] : post.data['from']
                if end_date.to_s[0..9] < DateTime.now.strftime("%Y-%m-%d")
                    post
                end
            end
        end
    end
end

Liquid::Template.register_filter(Jekyll::EventFilters)
