class StackElement
    constructor: (content) ->
        @content = content
        @prev = null

    getContent: () ->
        @content

    setContent: (c) ->
        @content = c

    getPrev: () ->
        @prev

    setPrev: (prev) ->
        @prev = prev