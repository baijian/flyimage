http = require "lapis.nginx.http"
db = require "lapis.db"
lapis = require "lapis"
csrf = require "lapis.csrf"

import respond_to from require "lapis.application"

lapis.serve class extends lapis.Application
    default_route: => status: 404, layout: false, "Not Found!"

    [index: "/"]: => @url_for "hello_world", name: "baijian"

    [hello_world: "/helloworld/:name"]: => 
        "Hello World #{@params.name}, index: #{@url_for "index"}"

    [images_new: "/images/new"]: respond_to {
        GET: => render: true
    }

