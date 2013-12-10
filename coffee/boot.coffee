# Avoid console errors in browsers that lack a console.
( () =>
    noop = => 
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
    console = window.console = window.console or {}

    while length--
        method = methods[length]
        if not console[method] then console[method] = noop
)()

extractClass = (s) ->
    tmp = ""
    i = s.length - 1
    c = ""

    while i >= 0
        if s[i] is "." then i = -1
        else tmp += s[i]
        i--

    for i in [tmp.length - 1..0]
        c += tmp[i]
    c

if not JSFOLDER? 
    throw new Error "You must set JSFOLDER var"

if not CROQUECLASS?
    throw new Error "You must set CROQUECLASS var"

require.config(
    baseUrl: JSFOLDER
    paths: 
        jquery: 'vendor/jquery.1.10.2'
        jqueryCookie: 'vendor/jquery-cookie.1.4.0'
        modernizr: 'vendor/modernizr.2.7.1'
        dependencies: 'deps'
    shim: 
        jquery: 
            exports: '$'
    # Uncomment line below for avoiding cache troubles when developing
    urlArgs: "bust=" + (new Date()).getTime()
)

define(
    'CroqueBase'
    [
        'jquery'
        'modernizr'
        'dependencies'
    ]
    () =>
        require( 
            [CROQUECLASS]
            () =>
                try 
                    eval "new " + (extractClass CROQUECLASS) + "()"
                catch e
                    console.log "You have tried to use a non existing class : " + e.message
        )
)

require ['CroqueBase']