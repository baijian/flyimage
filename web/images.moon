lapis = require "lapis"
import respond_to from require "lapis.application"

class ImagesApplication extends lapis.Application
    @path: "/images"   
    @name: "images_"

    [images_new: "/new"]: respond_to {
        GET: => @html -> 
                 h1 class: "header", "TO ADD.."
    }
