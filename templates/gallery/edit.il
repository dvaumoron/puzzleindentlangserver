Import "main"

:= WidgetBody
    Quote
        List
            h2
                := imageTitle (. Image Title)
                (. Messages EditLabel) " " imageTitle " "
                a @href=BaseUrl @role="button" (. Messages CancelLinkLabel)

            div
                := imageId (. Image ImageId)  
                := imageDesc (. Image Desc)
                img @src=CurrentUrl:"retrieve/":imageId @alt=imageDesc

            form @action=BaseUrl:"save" @method="POST" @enctype="multipart/form-data"
                div @class="hide"
                    input @type="text" @name="fileList" @value="image"
                    input @type="text" @name="formData[ImageId]" @value=imageId
                label
                    (. Messages TitleLabel)
                    input @type="text" @name="formData[Title]" @value=imageTitle
                label
                    (. Messages ImageFileLabel)
                    input @type="file" @name="image" @accept="image/png, image/jpeg"
                label
                    (. Messages ImageDescLabel)
                    input @type="text" @name="formData[Desc]" @value=imageDesc
                button @type="submit" (. Messages SaveLinkLabel)
