Import "main"

:= WidgetBody
    Quote
        List
            h2
                (. Messages EditLabel) " " (. ViewedUser Login) " "
                := viewedUserId (. ViewedUser Id)
                a @href="/profile/view/":viewedUserId @role="button" (. Messages CancelLinkLabel)

            p (profilePicture ViewedUser)

            div @class="hide"
                # to allow JavaScript or WebAssembly to display a localized error message
                span @id="errorEmptyLoginMessage" (. Messages EmptyLogin)
                span @id="errorEmptyPasswordMessage" (. Messages EmptyPassword)
                span @id="errorWrongConfimPasswordMessage" (. Messages WrongConfirmPassword)
                span @id="passwordHelpMessage" (. Messages PasswordRules)

            details
                summary (. Messages ChangeLoginLabel)
                form @id="changeLoginForm" @action="/profile/changeLogin" @method="POST"
                    label
                        (. Messages NewLoginLabel)
                        input @type="text" @id="loginField" @name="Login"
                    label
                        (. Messages PasswordLabel)
                        input @type="password" @id="passwordField" @name="Password"
                    button @type="button" @id="changeLoginButton" (. Messages SaveLinkLabel)

            details
                summary (. Messages ChangePasswordLabel)
                form @id="changePasswordForm" @action="/profile/changePassword" @method="POST"
                    label
                        (. Messages OldPasswordLabel)
                        input @type="password" @name="oldPassword"
                    label
                        (. Messages NewPasswordLabel)
                        a @href @id="passwordHelp" (span @class="material-symbols-outlined" "help")
                        input @type="password" @id="changePasswordField" @name="newPassword"
                    label
                        (. Messages ConfirmPasswordLabel)
                        input @type="password" @id="confirmChangePasswordField" @name="ConfirmPassword"
                    button @type="button" @id="changePasswordButton" (. Messages SaveLinkLabel)

            form @action="/profile/save" @method="POST" @enctype="multipart/form-data"
                h3 (. Messages EditProfileLabel)
                label
                    (. Messages UserPicLabel)
                    input @type="file" @name="picture" @accept="image/png, image/jpeg"
                label
                    (. Messages UserDescLabel)
                    := viewedUserDesc (. ViewedUser Desc)
                    input @type="text" @name="userDesc" @value=viewedUserDesc
                For (key value) (. ViewedUser Info)
                    label
                        [] Messages key
                        input @type="text" @name="userInfo[":key:"]" @value=value
                button @type="submit" (. Messages SaveLinkLabel)
