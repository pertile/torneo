<template>
    <section>
        <b-sidebar type="is-light" position="static" open >
            <div class="p-1">
                <b-menu>
                    <b-menu-list label="Menú">
                        <b-menu-item icon="information-outline" label="Acerca de"></b-menu-item>
                        <b-menu-item icon="settings">
                            <template slot="label" slot-scope="props">
                                Administrador
                                <b-icon class="is-pulled-right" :icon="props.expanded ? 'menu-down' : 'menu-up'"></b-icon>
                            </template>
                            <b-menu-item icon="license" label="Torneos" v-if="$can('browse_tournaments')" />
                            <b-menu-item icon="account" label="Personas" v-if="$can('browse_people')" />
                        </b-menu-item>
                        <b-menu-item v-if="$can('browse_matches')">
                            <template slot="label" slot-scope="props">    
                                 <router-link to="/partidos">Partidos</router-link>
                            </template>
                        </b-menu-item>
                        <b-menu-item v-if="$can('browse_incidents')">
                            <template slot="label" slot-scope="props">    
                                 <router-link to="/incidencias">Incidencias</router-link>
                            </template>
                        </b-menu-item>
                        
                        <!-- <b-menu-item>Planilla</b-menu-item> -->
                        
                        <b-menu-item>
                            <template slot="label" slot-scope="props">    
                                 <router-link to="/posiciones">Posiciones</router-link>
                            </template>
                        </b-menu-item>

                    </b-menu-list>
                </b-menu>
            </div>
        </b-sidebar>
    </section>
</template>

<script>
export default {
    data() {
        return {
            fullheight: true
        }
    },
};
</script>

<style>
.p-1 {
  padding: 1em;
}
</style>