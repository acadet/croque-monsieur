class Stack
    constructor: () ->
        @tail = null

    push: (e) ->
        e.setPrev @tail
        @tail = e

    pop: () ->
        if @isEmpty() then return null
        tmp = @tail
        @tail = @tail.getPrev()
        tmp

    isEmpty: () ->
        @tail is null