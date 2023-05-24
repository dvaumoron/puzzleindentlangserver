Import "main"

:= WidgetBody
    Quote
        List
            search (. Messages FilterLabel)
            paginate PreviousPageNumber NextPageNumber Filter

            If AllowedToCreate
                p (a @href=CurrentUrl:"create" @class="secondary" @role="button" (. Messages NewLinkLabel))

            := viewLinkLabel (. Messages ViewMoreLinkLabel)
            If AllowedToDelete
                List
                    := deleteLinkLabel (. Messages DeleteLinkLabel)
                    For post Posts
                        article
                            header
                                hgroup
                                    h2 (. post Title)
                                    h3 (profileLink (. post Creator)) " " (. post Date)
                            p (. post Content)
                            footer
                                := postId (. post PostId)
                                a @href=CurrentUrl:"view/":postId @class="outline" @role="button" viewLinkLabel
                                a @href=CurrentUrl:"delete/":postId @class="contrast" @role="button" deleteLinkLabel
                List
                    For post Posts
                        article
                            header
                                hgroup
                                    h2 (. post Title)
                                    h3 (profileLink (. post Creator)) " " (. post Date)
                            p (. post Content)
                            footer
                                := postId (. post PostId)
                                a @href=CurrentUrl:"view/":postId @class="outline" @role="button" viewLinkLabel
