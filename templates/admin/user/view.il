Import "main"

:= WidgetBody
    Quote
        List
            h2
                (. ViewedUser Login) " (" (. Messages RegistredAtLabel) (. ViewedUser RegistredAt) ") "
                a @href="/admin/user/list" @role="button" (. Messages CancelLinkLabel)
                If AllowedToUpdate
                    List
                        := viewedUserId (. ViewedUser Id)
                        a @href="/admin/user/edit/":viewedUserId @role="button" (. Messages EditLinkLabel)
                        a @href="/admin/user/delete/":viewedUserId @class="contrast" @role="button" (. Messages DeleteLinkLabel)

            For group Groups
                details
                    summary (. group DisplayName)
                    ul
                        For role (. group Roles)
                            li
                                (. role Name) " ("
                                For action (. role Actions)
                                    action " "
                                ")"
