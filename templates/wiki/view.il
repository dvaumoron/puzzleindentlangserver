Import "main"

:= WidgetBody
    Quote
        List
            h2
                WikiTitle " "
                If WikiVersion
                    "(" WikiVersion ") "
                    a @href=BaseUrl:"edit/":WikiTitle @role="button" (. Messages EditLinkLabel)
                a @href=BaseUrl:"list/":WikiTitle @role="button" (. Messages ListLinkLabel)

            div WikiContent
