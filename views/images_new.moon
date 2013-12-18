import Widget from require "lapis.html"

class ImagesNew extends Widget
    content: =>
        form {
            action: "/images"
            method: "POST"
            enctype: "multipart/form-data"
        }, ->
            input type: "file", name: "file"
            input type: "submit"
