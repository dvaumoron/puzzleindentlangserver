Import "main"

:= WidgetBody
    Quote
        List
            header
                hgroup
                    h1
                        (. Post Title) " "
                        a @href=BaseUrl @role="button" (. Messages CancelLinkLabel)
                    h3 (. Messages PostAuthorLabel) " " (profileLink (. Post Creator))
                    h3 (. Messages PostDateLabel) " " (. Post Date)

            div (. Post Content)

            br

            paginate PreviousPageNumber NextPageNumber Filter

            := postId (. Post PostId)
            If AllowedToCreate
                form @id="commentForm" @action=BaseUrl:"comment/save/":postId @method="POST"
                    := leaveCommentLabel (. Messages LeaveCommentLabel)
                    textarea @id="commentField" @name="comment" @rows="5" @placeholder=leaveCommentLabel ""
                    div @class="hide"
                        # to allow JavaScript or WebAssembly to display a localized error message
                        span @id="errorEmptyCommentMessage" (. Messages EmptyComment)
                    button @type="button" @id="commentButton" @class="secondary" (. Messages PublishLinkLabel)

            If CommentMsg
                h6 @class="error" CommentMsg

            If AllowedToDelete
                List
                    := deleteLinkLabel (. Messages DeleteLinkLabel)
                    For comment Comments
                        article
                            div @class="grid"
                                profilePictureLink (. comment Creator)
                                div
                                    p (. comment Date)
                                    p (EscapeHtml (. comment Text))
                            footer
                                := id (. comment Id)
                                a @href=BaseUrl:"comment/delete/":postId:"/":id @class="contrast" @role="button" deleteLinkLabel
                For comment Comments
                    article
                        div @class="grid"
                            profilePictureLink (. comment Creator)
                            div
                                p (. comment Date)
                                p (EscapeHtml (. comment Text))
