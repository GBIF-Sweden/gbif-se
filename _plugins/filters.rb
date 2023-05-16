module Jekyll
    module EventFilters

        def coming_events(events)
            events.select do |event|
                end_date = event.data['to'] ? event.data['to'] : event.data['from']
                if end_date.to_s[0..9] >= DateTime.now.strftime("%Y-%m-%d")
                    event
                end
            end
        end

        def past_events(events)
            events.select do |event|
                end_date = event.data['to'] ? event.data['to'] : event.data['from']
                if end_date.to_s[0..9] < DateTime.now.strftime("%Y-%m-%d")
                    event
                end
            end
        end

    end
end

Liquid::Template.register_filter(Jekyll::EventFilters)
