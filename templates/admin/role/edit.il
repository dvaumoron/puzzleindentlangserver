Import "main"

:= WidgetBody
    Quote
        List
            h2
                If (== RoleName "new")
                    (. Messages NewRoleLabel) " " GroupDisplayName
                    (. Messages EditLabel) " " GroupDisplayName "/" RoleName
                " " (a @href="/admin/role/list" @role="button" (. Messages CancelLinkLabel))

            form @id="editRoleForm" @action="/admin/role/save" @method="POST"
                div (If (!= RoleName "new") @class="hide")
                    label
                        . Messages NameLabel
                        input t@ype="text" @id="editRoleNameField" @name="RoleName" @value=RoleName
                div @class="hide"
                    # to allow JavaScript or WebAssembly to display a localized error message
                    span @id="errorBadRoleNameMessage" (. Messages ErrorBadRoleName)
                    input @type="text" @name="Group" @value=Group
                fieldset
                    label
                        . Messages AccessLabel
                        input @type="checkbox" @name="actions" @value="access" (If Access @checked) @role="switch"
                    label
                        . Messages CreateLabel
                        input @type="checkbox" @name="actions" @value="create" (If Create @checked) @role="switch"
                    label
                        . Messages UpdateLabel
                        input @type="checkbox" @name="actions" @value="update" (If Update @checked) @role="switch"
                    label
                        . Messages DeleteLabel
                        input @type="checkbox" @name="actions" @value="delete" (If Delete @checked) @role="switch"
                button @type="button" @id="saveRoleButton" (. Messages SaveLinkLabel)
