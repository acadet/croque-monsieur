class Module
    constructor: (name, declaration) ->
        @name = name
        @declaration = declaration

    getName: () ->
        @name

    setName: (n) ->
        @name = n

    getDeclaration: () ->
        @declaration

    setDeclaration: (f) ->
        @declaration = f