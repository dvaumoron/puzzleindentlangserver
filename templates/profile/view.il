Import "main"

:= WidgetBody
    Quote
        List
            h2
                (. ViewedUser Login) " (" (. Messages RegistredAtLabel) " " (. ViewedUser RegistredAt) ") "
                If AllowedToUpdate
                    a @href="/profile/edit" @role="button" (. Messages EditLinkLabel)

            div (profilePicture ViewedUser)
            div (. ViewedUser Desc)

            ul
                For (key value) (. ViewedUser Info)
                    li
                        ul
                            li key
                            li value

            For right UserRight
                div
                    p (. right DisplayName)
                    ul
                        For role (. right Roles)
                            li
                                (. role Name) " ("
                                For action (. role Actions)
                                    action " "
                                ")"
