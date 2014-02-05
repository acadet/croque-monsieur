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
        JSFOLDER + 'system/default/Vertice.js'
        JSFOLDER + 'system/default/OrientedGraph.js'
    ]
    () =>
        ###
         # @class Croque
         # @brief Loads needed class and all its dependencies. Sets default config
         ###
        class Croque
            constructor: (folder, c) ->
                @folder = folder # JS folder
                @classPath = c # Path to needed class
                @className = @extractClass c # Name of needed class
                @loaded = 0 # Number of modules currently loaded
                @total = 0 # Amount of modules

                @graph = new OrientedGraph() # Graph to manage dependencies

                @rootVertice = new Vertice(new Module(@className)) # Root vertice, last dep to execute

                @graph.addVertice @rootVertice
                
                @fixConsole()

                # RequireJS config
                # Customize your config as your like
                @requireConfig =
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


                require.config(
                    @requireConfig
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
                        'system/default/Interface'
                    ]
                    () =>
                        require(
                            [@classPath]
                            () =>
                                # When all dependencies are loaded, do code below
                                @whenReady () =>
                                    # First execute each declaration of class
                                    # And add to global environment
                                    
                                    # Browses Graph with a deep method
                                    browser = (v) =>
                                        if v.isWhite()
                                            v.setGrey()
                                            
                                            @graph.mapNeighborhood v, browser
                                            
                                            v.setBlack()
                                            m = v.getContent()
                                            window[m.getName()] = (m.getDeclaration())()

                                    browser(@rootVertice)

                                    try
                                        @mainClass = eval "new " + @className + "()"
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

            getMainClass: () ->
                @mainClass

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
                
                s = @extractClass name

                # Updates declaration of a module
                # Each mod should have been added to the graph before, due to deps
                
                root = @graph.find(s)

                if not root?
                    throw new Error 'Module should have already been in graph'

                # Above all, do not execute it now, wait for dependencies
                root.getContent().setDeclaration(declaration)

                # Load dependencies
                for d in deps
                    if @requireConfig.paths[d]? or d is 'quoJS'
                        require [d]
                    else
                        v = @graph.find(@extractClass(d))

                        # First time encountering a dep
                        if not v?
                            v = new Vertice(new Module(@extractClass(d)))
                            @total++
                            @graph.addVertice v
                            require [d]

                        # Everytime, add dep into graph
                        @graph.bindVertices root, v

                @loaded++


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
