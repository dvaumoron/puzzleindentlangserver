Import "main"

:= WidgetBody
    Quote
        List
            h2
                (. Thread Text) " "
                a @href=BaseUrl @role="button" (. Messages CancelLinkLabel)

            search (. Messages FilterLabel)
            paginate PreviousPageNumber NextPageNumber Filter

            := threadId (. Thread Id)
            If AllowedToDelete
                List
                    := deleteLinkLabel (. Messages DeleteLinkLabel)
                    For message ForumMessages
                        div @class="grid"
                            profilePictureLink (. message Creator)
                            div
                                p (. message Date)
                                p (EscapeHtml (. message Text))
                            := id (. message Id)
                            p (a @href=BaseUrl:"message/delete/":threadId:"/":id @class="contrast" @role="button" deleteLinkLabel)
                For message ForumMessages
                    div @class="grid"
                        profilePictureLink (. message Creator)
                        div
                            p (. message Date)
                            p (EscapeHtml (. message Text))

            If AllowedToCreate
                form @id="createForumMessageForm" @action=BaseUrl:"message/save/":threadId @method="POST"
                    := responseMessageLabel (. Messages ResponseMessageLabel)
                    textarea @id="forumMessageField" @name="message" @rows="5" @placeholder=responseMessageLabel ""
                    div @class="hide"
                        # to allow JavaScript or WebAssembly to display a localized error message
                        span @id="errorEmptyForumMessageMessage" (. Messages EmptyForumMessage)
                    button @type="button" @id="createForumMessageButton" @class="secondary" (. Messages PublishLinkLabel)
