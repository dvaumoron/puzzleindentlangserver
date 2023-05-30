Import "main"

:= WidgetBody
    Quote
        List
            paginate PreviousPageNumber NextPageNumber ""

            := editLinkLabel (. Messages EditLinkLabel)
            For image Images
                article
                    header
                        := imageId (. image ImageId)
                        hgroup
                            h2 (. image Title)
                            := imageDesc (. image Desc)
                            p (img @src=CurrentUrl:"retrieve/":imageId @alt=imageDesc @width=100)
                        footer
                            a @href=CurrentUrl:"edit/":imageId @class="outline" @role="button" editLinkLabel