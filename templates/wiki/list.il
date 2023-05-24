Import "main"

:= WidgetBody
    Quote
        List
            h2
                WikiTitle " "
                a @href=BaseUrl:"view/":WikiTitle @role="button" (. Messages CancelLinkLabel)

            := viewLinkLabel (. Messages ViewLinkLabel)
            If AllowedToDelete
                List
                    := deleteLinkLabel (. Messages DeleteLinkLabel)
                    For version Versions
                        div @class="grid"
                            := number (. version Number)
                            p (a @href=BaseUrl:"view/":WikiTitle:"?version=":number number)
                            p (profileLink (. version Creator))
                            p (a @href=BaseUrl:"delete/":WikiTitle:"?version=":number @class="contrast" @role="button" deleteLinkLabel)
                List
                    For version Versions
                        div @class="grid"
                            := number (. version Number)
                            p (a @href=BaseUrl:"view/":WikiTitle:"?version=":number number)
                            p (profileLink (. version Creator))
