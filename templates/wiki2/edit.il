Import "main"

:= WidgetBody
    Quote
        List
            h2
                (. Messages EditLabel) " " WikiTitle
                If (!= WikiVersion "0")
                    a @href=BaseUrl:"view/":WikiTitle @class="outline" @role="button" (. Messages CancelLinkLabel)

            form @action=BaseUrl:"save/":WikiTitle @method="POST"
                textarea @name="content" @rows="20" WikiContent ""
                div @class="hide"
                    input @type="text" @name="version" @value=WikiVersion
                button @type="submit" @class="outline" (. Messages SaveLinkLabel)
