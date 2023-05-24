Import "main"

:= WidgetBody
    Quote
        div @class="grid"
            a @href="/admin/user/list" @class="outline" @role="button" (. Messages UserListTitle)
            a @href="/admin/role/list" @class="outline" @role="button" (. Messages RoleListTitle)
