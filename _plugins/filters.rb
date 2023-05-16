module Jekyll
    module EventFilter

        def event_type(event)
            end_date = event['to'] ? event['to'] : event['from']
            if end_date.to_s[0..9] >= DateTime.now.strftime("%Y-%m-%d")
                "coming"
            else
                "past"
            end
        end

        def filter_events(events, type)
            events.select do |event|
                end_date = event.data['to'] ? event.data['to'] : event.data['from']
                if type == 'coming'
                    if end_date.to_s[0..9] >= DateTime.now.strftime("%Y-%m-%d")
                        event
                    end
                elsif type == 'past'
                    if end_date.to_s[0..9] < DateTime.now.strftime("%Y-%m-%d")
                        event
                    end
                end
            end
        end

    end
end

Liquid::Template.register_filter(Jekyll::EventFilter)
