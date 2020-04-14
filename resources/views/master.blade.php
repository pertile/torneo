<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" type="text/css" href="/css/app.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css">
        <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>

        <title>Gestión de créditos</title>

        
    </head>
    <body>
        <div id="app">
            @include('header')

            <section class="section">
                <div class="container">
                    
                    <router-view></router-view>
                </div>            
            </section>
        </div>
        <script src="/js/app.js"></script>
    </body>
</html>
