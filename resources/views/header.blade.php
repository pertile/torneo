<section class="hero is-primary">
    <!-- Hero head: will stick at the top -->
    <div class="hero-head">
		<b-navbar transparent>
			
			<template slot="brand">
            	<b-navbar-item tag="router-link" :to="{ path: '/' }">
                	<img
                    	src="/storage/Logo.png"
                    	alt="Torneo de básquet"
                  	>
            	</b-navbar-item>
			</template>

			<template slot="end">
				
				@guest
					<guest-buttons />
					<!-- <b-navbar-item tab="a" 
						@click="$buefy.modal.open({ parent: this, component: Login })">
						Acceder
					</b-navbar-item>
					<b-navbar-item tab="a" href="/register">Registrarse</b-navbar-item>	 -->
				@else
					<b-navbar-item tab="router-link" :to="{ path: '/' }">{{ Auth::user()->name }}</b-navbar-item>	
					<b-navbar-item tab="router-link" :to="{ path: '/' }" onclick="event.preventDefault();
                        document.getElementById('logout-form').submit();">
						Salir
					</b-navbar-item>
					<form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
						@csrf
					</form>
				
				@endguest
			</template>
		</b-navbar>
		
	</div>
	    <!-- Hero content: will be in the middle -->
	<div class="hero-body">
    	<div class="container has-text-centered">
        	<h1 class="title">
          		Torneo de Básquet
        	</h1>
        	<h2 class="subtitle">
          		Ambach
        	</h2>
      </div>
	</div>
</section>