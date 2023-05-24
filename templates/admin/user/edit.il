Import "main"

:= WidgetBody
    Quote
        List
            h2
                (. Messages EditLabel) " " (. ViewedUser Login) " "
                := viewedUserId (. ViewedUser Id)
                a @href="/admin/user/view/":viewedUserId @role="button" (. Messages CancelLinkLabel)

            form @action="/admin/user/save/":viewedUserId @method="POST"
                For group Groups
                    details
                        summary (. group DisplayName)
                        fieldset
                            := groupName (. group Name)
                            For role (. group Roles)
                                := roleName (. role Name)
                                label
                                    roleName " ("
                                    For action (. role Actions)
                                        action " "
                                    ")"
                                    input @type="checkbox" @name="roles" @value=roleName:"/":groupName @checked @role="switch"
                            For role (. group AddableRoles)
                                := roleName (. role Name)
                                label
                                    roleName " ("
                                    For action (. role Actions)
                                        action " "
                                    ")"
                                    input @type="checkbox" @name="roles" @value=roleName:"/":groupName @role="switch"
                button @type="submit" (. Messages SaveLinkLabel)
