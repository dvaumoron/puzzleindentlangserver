Import "main"

:= WidgetBody
    Quote
        List
            h2 Total " " (. Messages ThreadsLabel)
            search (. Messages FilterLabel)
            paginate PreviousPageNumber NextPageNumber Filter

            If AllowedToCreate
                p (a @href=CurrentUrl:"create" @class="secondary" @role="button" (. Messages NewLinkLabel))

            := viewLinkLabel (. Messages ViewLinkLabel)
            If AllowedToDelete
                List
                    := deleteLinkLabel (. Messages DeleteLinkLabel)
                    For thread Threads
                        div @class="grid"
                            := id (. thread Id)
                            p (a @href=CurrentUrl:"view/":id (. thread Text))
                            p (profileLink (. thread Creator))
                            p (. thread Date)
                            p (a @href=CurrentUrl:"delete/"id @class="contrast" @role="button" deleteLinkLabel)
                For thread Threads
                    div @class="grid"
                        := id (. thread Id)
                        p (a @href=CurrentUrl:"view/":id (. thread Text))
                        p (profileLink (. thread Creator))
                        p (. thread Date)
