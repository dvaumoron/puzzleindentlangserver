Import "main"

:= WidgetBody
    Quote
        List
            h2
                (. Messages EditLabel) " " Login " "
                a @href="/" @role="button" (. Messages CancelLinkLabel)

            form @action="/settings/save" @method="POST"
                For (key value) Settings
                    label
                        [] Messages key
                        input @type="text" @name="settings[":key:"]" @value=value
                button @type="submit" (. Messages SaveLinkLabel)
