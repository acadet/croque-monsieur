# Avoid console errors in browsers that lack a console.
( ->
    noop = -> 
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
    r = new RegExp '[.][a-zA-Z0-9\-_]+'
    a = (r.exec s)[0]
    a.substring 1

require.config(
    baseUrl: JSFOLDER
    paths: 
        jquery: 'vendor/jquery.1.10.2'
        jqueryCookie: 'vendor/jquery-cookie.1.4.0'
        modernizr: 'vendor/modernizr.2.7.1'
        dependencies: 'dependencies'
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
        'dependencies'
    ]
    (dependencies) =>
        require( 
            [CROQUECLASS]
            () =>
                eval "new " + (extractClass CROQUECLASS) + "()"
        )
)

require ['CroqueBase']