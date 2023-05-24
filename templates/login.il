Import "main"

:= WidgetBody
    Quote
        form @id="loginForm" @action="/login/submit" @method="POST"
            label
                . Messages LoginLabel
                input @type="text" @id="loginField" @name="Login"
            label
                . Messages PasswordLabel
                input @type="password" @id="passwordField" @name="Password"
            div @id="confirmPasswordBlock" @class="hide"
                label
                    . Messages ConfirmPasswordLabel
                    input @type="password" @id="confirmPasswordField" @name="ConfirmPassword"
            div @class="hide"
                input @type="text" @id="loginRegisterField" @name="Register"
                input @type="text" @name="Redirect" @value=Redirect
                input @type="text" @name="PrevUrlWithError" @value=PrevUrlWithError
                # to allow JavaScript or WebAssembly to display a localized error message
                span @id="errorEmptyLoginMessage" (. Messages EmptyLogin)
                span @id="errorEmptyPasswordMessage" (. Messages EmptyPassword)
                span @id="errorWrongConfimPasswordMessage" (. Messages WrongConfirmPassword)
            button @type="button" @id="loginSubmitButton" (. Messages LoginLinkLabel)
            div
                := registerLinkLabel (. Messages RegisterLinkLabel)
                button @type="button" @id="loginRegisterButton" registerLinkLabel
                button @type="button" @id="loginRegisterButton2" @class="hide" registerLinkLabel
