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

class Stack
    constructor: () ->
        @tail = null

    push: (e) ->
        e.setPrev @tail
        @tail = e

    pop: () ->
        tmp = @tail
        @tail = @tail.getPrev()
        tmp

    isEmpty: () ->
        @tail is null


class Croque
    constructor: (folder, c) ->
        if not folder? then throw new Error 'You must set JSFOLDER var'
        if not c? then throw new Error 'You must set CROQUECLASS var'

        @start = new Date().getMilliseconds()
        @folder = folder
        @classPath = c
        @className = @extractClass c
        @fixedConsole = false
        @loaded = 0
        @total = 0
        @stack = new Stack


        @fixConsole()

        require.config(
            baseUrl: @folder
            paths: 
                jquery: 'vendor/jquery.1.10.2'
                jqueryCookie: 'vendor/jquery-cookie.1.4.0'
                modernizr: 'vendor/modernizr.2.7.1'
            shim: 
                jquery: 
                    exports: '$'
            # Uncomment line below for avoiding cache troubles when developing
            urlArgs: "bust=" + (new Date()).getTime()
        )

        require(
            [
                'jquery'
                'modernizr'
                'system/Environment'
                'system/Log'
            ]
            () =>
                require( 
                    [@classPath]
                    () =>
                        @whenReady () =>
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

    # Avoid console errors in browsers that lack a console.
    fixConsole: () ->
        if @fixedConsole then false
        else 
            @fixedConsole = true
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

    monsieur: (name, deps, declaration) ->
        @total++
        define name, deps
        require [name], () =>
            @loaded++
            s = @extractClass name
            @stack.push new StackElement(new Module s, declaration)

    whenReady: (f) ->
        if @loaded >= @total 
            f()
        else
            setTimeout(
                () =>
                    @whenReady f
                250
            )


window.Croque = new Croque(JSFOLDER, CROQUECLASS)