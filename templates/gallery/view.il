Import "main"

:= WidgetBody
    Quote
        List
            paginate PreviousPageNumber NextPageNumber ""

            If Id
                p (a @href=CurrentUrl:"create" @class="secondary" @role="button" (. Messages NewLinkLabel))

            := editLinkLabel (. Messages EditLinkLabel)
            For image Images
                article
                    header                    
                        h2 (. image Title)
                    := imageId (. image ImageId)
                    := imageDesc (. image Desc)
                    p (img @src=CurrentUrl:"retrieve/":imageId @alt=imageDesc @width=100)
                    footer
                        a @href=CurrentUrl:"edit/":imageId @class="outline" @role="button" editLinkLabel