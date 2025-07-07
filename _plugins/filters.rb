module Jekyll
    module EventFilter

        def event_type(event)
            end_date = event["end_time"] ? event["end_time"] : event["start_time"]
            if end_date.to_s[0..9] >= DateTime.now.strftime("%Y-%m-%d")
                "upcoming"
            else
                "past"
            end
        end

        def filter_events(events, type_to_include)
            events.select do |event|
                if event_type(event) == type_to_include
                    event
                end
            end
        end

    end
end

Liquid::Template.register_filter(Jekyll::EventFilter)
