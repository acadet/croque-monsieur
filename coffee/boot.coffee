###
 # @file boot.coffee
 # @author Adrien Cadet <acadet@live.fr>
 # @brief Wraps initialization of Croque Monsieur
 ###

# First, check if 2 args were given
(() =>
    if not JSFOLDER? then throw new Error 'You must set JSFOLDER var'
    if not CROQUECLASS? then throw new Error 'You must set CROQUECLASS var'
)()

# Load boot module
require(
    [
        JSFOLDER + 'system/default/Module.js'
        JSFOLDER + 'system/default/StackElement.js'
        JSFOLDER + 'system/default/Stack.js'
    ]
    () =>
        ###
         # @class Croque
         # @brief Loads needed class and all its dependencies. Set default config
         ###
        class Croque
            constructor: (folder, c) ->
                @folder = folder # JS folder
                @classPath = c # Path to needed class
                @className = @extractClass c # Name of needed class
                @loaded = 0 # Number of modules currently loaded
                @total = 0 # Amount of modules
                @stack = new Stack # Stack to manage dependencies
                
                @fixConsole()

                # RequireJS config
                require.config(
                    baseUrl: @folder
                    paths: 
                        jquery: 'vendor/jquery.1.10.2'
                        jqueryCookie: 'vendor/jquery-cookie.1.4.0'
                        modernizr: 'vendor/modernizr.2.7.1'
                        jqueryUI: 'vendor/jquery-ui.1.10.3'
                    shim: 
                        jquery: 
                            exports: '$'
                        quoJS:
                            exports: '$$'
                    # Uncomment line below for avoiding cache troubles when developing
                    urlArgs: "bust=" + (new Date()).getTime()
                )

                # QuoJS is incompatible with IE
                # Load it only if it's not this guy
                if /MSIE (\d+\.\d+);/.test(navigator.userAgent)
                    define 'quoJS', []
                else
                    define 'quoJS', ['vendor/quo.2.3.6']

                # Launch main class' requirement
                require(
                    [
                        'jquery'
                        'modernizr'
                        'system/default/Environment'
                        'system/default/Log'
                    ]
                    () =>
                        require( 
                            [@classPath]
                            () =>
                                # When all dependencies are loaded, do code below
                                @whenReady () =>
                                    # First execute each declaration of class
                                    # And add to global environment
                                    while not @stack.isEmpty()
                                        m = @stack.pop().getContent()
                                        window[m.getName()] = (m.getDeclaration())()
                                    try
                                        eval "new " + @className + "()"
                                    catch e
                                        Log.w "CroqueMonsieur: error when constructing main class: " + e.message
                                        Log.w e.stack
                        )
                )

            ###
             # Avoid console errors in browsers that lack a console.
             # Replace each function by an empty one
             ###
            fixConsole: () ->
                noop = => {}
                methods = [
                    'assert'
                    'clear'
                    'count'
                    'debug'
                    'dir'
                    'dirxml'
                    'error'
                    'exception'
                    'group'
                    'groupCollapsed'
                    'groupEnd'
                    'info'
                    'log'
                    'markTimeline'
                    'profile'
                    'profileEnd'
                    'table'
                    'time'
                    'timeEnd'
                    'timeStamp'
                    'trace'
                    'warn'
                ]
                length = methods.length
                console = window.console is window.console or {}

                while length--
                    method = methods[length]
                    if not console[method] then console[method] = noop
                true

            ###
             # Extract class from given path
             ###
            extractClass: (s) ->
                if not s? then throw new Error 'extractClass needs a non empty string'
                tmp = ""
                i = s.length - 1
                c = ""

                while i >= 0
                    if s[i] is "/" then i = -1
                    else tmp += s[i]
                    i--

                for i in [tmp.length - 1..0]
                    c += tmp[i]
                c

            ###
             # VI Function. Used to define each module of the app
             # @param name{String} Name of module
             # @param deps{Array} Array of dependencies' name
             # @param declaration{Function} Declaration of class
             ###
            miam: (name, deps, declaration) ->
                if not name? then throw new Error 'Your module needs a name'
                if not deps? then throw new Error 'Your module needs at least an empty array of dependencies'
                if not declaration? then throw new Error 'Your module needs a declaration'
                
                @total++
                define name, deps
                require [name], () =>
                    @loaded++
                    s = @extractClass name
                    # Add declaration to stack
                    # Above all, do not execute it now, wait for dependencies
                    @stack.push new StackElement(new Module s, declaration)

            ###
             # Execute a function when init is done
             # (deps are all loaded)
             ###
            whenReady: (f) ->
                if @loaded >= @total 
                    f()
                else
                    setTimeout(
                        () =>
                            @whenReady f
                        250
                    )

        # Bind to global environement
        window.Croque = new Croque(JSFOLDER, CROQUECLASS)
        window.miam = (name, deps, declaration) ->
            window.Croque.miam name, deps, declaration        
)
