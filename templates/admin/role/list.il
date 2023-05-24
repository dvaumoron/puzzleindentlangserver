Import "main"

:= WidgetBody
    Quote
        List
            h2 (. Messages RoleListTitle)

            := groupDescPublic (. Messages GroupDescPublic)
            := editLinkLabel (. Messages EditLinkLabel)
            := deleteLinkLabel (. Messages DeleteLinkLabel)
            := newLinkLabel (. Messages NewLinkLabel)
            For group Groups
                details
                    summary (. group DisplayName)
                    := groupName (. group Name)
                    If (== groupName "public")
                        p groupDescPublic
                        List
                            For role (. group Roles)
                                := roleName (. role Name)
                                div @class="grid"
                                    p
                                        roleName " ("
                                        For action (. role Actions)
                                            action " "
                                        ")"
                                    p (a @href="/admin/role/edit/":roleName:"/":groupName @role="button" editLinkLabel)
                                    # delete role link (use an empty action form)
                                    form @action="/admin/role/save" @method="POST"
                                        div @class="hide"
                                            input @type="text" @name="RoleName" @value=roleName
                                            input @type="text" @name="Group" @value=groupName
                                        button @type="submit" @class="contrast" deleteLinkLabel
                            p (a @href="/admin/role/edit/new/":groupName @class="secondary" @role="button" newLinkLabel)
