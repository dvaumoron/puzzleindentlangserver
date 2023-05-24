Import "main"

:= WidgetBody
    Quote
        List
            header
                h1
                    PreviewTitle " "
                    a @href=BaseUrl @role="button" (. Messages CancelLinkLabel)

            div PreviewHTML

            form @id="publishPostForm" @action=BaseUrl:"preview" @method="POST"
                label
                    . Messages TitleLabel
                    input @type="text" @id="postTitleField" @name="title" @value=PreviewTitle
                textarea @id="postMarkdownField" @name="markdown" @rows="20" Markdown ""
                div @class="hide"
                    # to allow JavaScript or WebAssembly to display a localized error message
                    span @id="errorEmptyPostTitleMessage" (. Messages EmptyPostTitle)
                    span @id="errorEmptyPostContentMessage" (. Messages EmptyPostContent)
                    span @id="errorModifiedMarkdownMessage" (. Messages ModifiedMarkdown)
                button @type="submit" (. Messages UpdatePreviewLinkLabel)
                button @type="button" @id="publishPostButton" (. Messages PublishLinkLabel)
