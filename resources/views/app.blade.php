<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" type="text/css" href="/css/app.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css">
        <link rel="stylesheet" href="https://cdn.materialdesignicons.com/2.5.94/css/materialdesignicons.min.css">
        
        <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>

        <title>Torneo de básquet</title>

        <script>
            @auth
                window.Permissions = {!! Auth::user()->allPermissions() !!};
                
            @else
                window.Permissions = [];
            @endauth
        </script>
        
    </head>
    <body>
        <div id="app">
            <!-- <div class="container"> -->
                <header>
                    @include('header')
                </header>

                <main class="flex">

                    
                    <!-- <aside class="w-1/5"> -->
                    
                    <side-bar></side-bar>
                    
                        <!-- <ul>
                            <li><router-link to="/" exact>Inicio</router-link></li>
                            <li><router-link to="/torneo">Torneos</router-link></li>
                            <li><router-link to="/partidos">Partidos</router-link></li>
                            <li><router-link to="/incidencias">Incidencias</router-link></li>
                            <li><router-link to="/planilla">Planilla</router-link></li>
                            <li><router-link to="/posiciones">Posiciones</router-link></li>
                            <li><router-link to="/acercade">Acerca de</router-link></li>    
                        </ul> -->
                    <!-- </aside> -->
                
                    <div class="primary flex-1">
                        <router-view></router-view>
                    </div>

                </main>

            <!-- </div> -->
            
            <hr>

        </div>
        <script src="/js/app.js"></script>
    </body>


</html>