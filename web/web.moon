lapis = require "lapis"
lapis.serve class extends lapis.Application
    "/": => "Hello World!"
