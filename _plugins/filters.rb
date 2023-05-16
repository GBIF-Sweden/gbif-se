module Jekyll
    module EventFilter

        def event_type(event)
            end_date = event["to"] ? event["to"] : event["from"]
            if end_date.to_s[0..9] >= DateTime.now.strftime("%Y-%m-%d")
                "coming"
            else
                "past"
            end
        end

        def filter_events(events, type_to_include)
            events.select do |event|
                if event_type(event.data) == type_to_include
                    event
                end
            end
        end

    end
end

Liquid::Template.register_filter(Jekyll::EventFilter)
