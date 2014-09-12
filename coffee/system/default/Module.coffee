###
 # @class Module
 # @brief Used structure to manage dependencies
 ###
class Module
    #region Constructors

    constructor: (name, declaration) ->
        @name = name
        @declaration = declaration
    
    #endregion Constructors
    
    #region Private
    
    #endregion Private
    
    #region Public

    ###
     # Gets name
     ###
    getName: () ->
        @name

    ###
     # Sets name
     ###
    setName: (n) ->
        @name = n

    ###
     # Gets stored declaration
     ###
    getDeclaration: () ->
        @declaration

    ###
     # Stores declaration
     ###
    setDeclaration: (f) ->
        @declaration = f
    
    #endregion Public