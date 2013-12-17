lapis = require "lapis"
lapis.serve class extends lapis.Application
    default_route: => status: 404, layout: false, "Not Found!"

    @include require "web.images"

