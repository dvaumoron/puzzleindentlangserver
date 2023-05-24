
Func profileLink (user)
    := id (. user Id)
    Return (a @href="/profile/view/":id (. user Login))

Func profilePicture (user)
    := id (. user Id)
    := login (. user Login)
    Return (img @src="/profile/picture/":id @alt=login @width=100)

Func profilePictureLink (user)
    := id (. user Id)
    Return
        div
            p (a @href="/profile/view/":id (profilePicture user))
            p (profileLink user)

Func search (filterLabel)
    Return
        form @action=CurrentUrl @method="GET" @role="search"
            label
                filterLabel
                input @type="search" @name="filter"
            div @class="hide"
                input @type="text" @name="pageNumber" @value="1"
            button @type="submit" (span @class="material-symbols-outlined" "search")

Func paginate (previousPageNumber nextPageNumber filter)
    Return
        If (Or previousPageNumber nextPageNumber)
            div @class="grid"
                If previousPageNumber
                    form @action=CurrentUrl @method="GET"
                        div @class="hide"
                            input @type="text" @name="pageNumber" @value=previousPageNumber
                            If filter
                                input @type="text" @name="filter" @value=filter
                        button @type="submit" (span @class="material-symbols-outlined" "chevron_left")
                    p (button @type="button" @disabled (span @class="material-symbols-outlined" "chevron_left"))

                If nextPageNumber
                    form @action=CurrentUrl @method="GET"
                        div @class="hide"
                            input @type="text" @name="pageNumber" @value=nextPageNumber
                            If filter
                                input @type="text" @name="filter" @value=filter
                        button @type="submit" (span @class="material-symbols-outlined" "chevron_right")
                    p (button @type="button" @disabled (span @class="material-symbols-outlined" "chevron_right"))

Func liPageLink (page)
    := url (. page Url)
    Return (li (a @href=url (. page Name)))

html
    head
        meta @http-equiv="Content-Type" @content="text/html; charset=UTF-8"
        meta @name="viewport" @content="width=device-width, initial-scale=1"
        title "PuzzleTest - " PageTitle
        link @href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght@200" @rel="stylesheet"
        link @href="/static/css/pico.min.css" @type="text/css" @rel="stylesheet"
        link @href="/static/css/main.css" @type="text/css" @rel="stylesheet"
        WidgetHeader
    body
        nav @class="container-fluid"
            ul
                li (a @href="/" (img @src="/favicon.ico"))
                li PageTitle
                If LangSelectorUrl
                    li
                        details @role="list"
                            summary (. Messages SelectLangLabel)
                            ul
                                For lang AllLang
                                    li (a @href=LangSelectorUrl:"&lang=":lang (img @src="/langPicture/":lang @alt=lang))
            If LoginUrl
                ul
                    If Login
                        List
                            li (. Messages WelcomeLabel) " " (profileLink (GetEnv))
                            li (a @href="/settings" @class="outline" @role="button" (. Messages PageTitleSettings))
                            If ViewAdmin
                                li (a @href="/admin" @class="outline" @role="button" (. Messages PageTitleAdmin))
                            li (a @href=LoginUrl @class="secondary" @role="button" (. Messages LogoutLinkLabel))
                        li (a @href=LoginUrl @class="secondary" @role="button" (. Messages LoginLinkLabel))
        If SubPages
            nav @class="container-fluid"
                ul
                    For page SubPages
                        liPageLink page
        nav @class="container-fluid" @aria-label="breadcrumb"
            ul
                li (a @href="/" (span @class="material-symbols-outlined" "home"))
                For page Ariane
                    liPageLink page
        div @class="container-fluid"
            If ErrorMsg
                h6 @class="error" ErrorMsg
            Eval WidgetBody
        footer @class="container-fluid"
            "Made with " (a @href="https://github.com/dvaumoron/puzzleweb" "PuzzleWeb") " and " (a @href="https://picocss.com/" "Pico.css")
        script @src="/static/js/wasm_exec.js" ""
        script @src="/static/js/wiki_link.js" ""
        script @src="/static/js/main.js" ""
