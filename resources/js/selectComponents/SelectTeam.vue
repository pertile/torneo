<template>
    <div class="field"> 
        <label class="label" for="selectTeam">Equipo</label>
        <multiselect id="selectTeam" 
            :loading="isLoading"
            v-model="value"
            track-by="id"
            label="name"
            :placeholder="placeholder"
            :options="teams" 
            :searchable="true"
            :multiple="!edit"
            :close-on-select="edit"
            @input="onChange">
        </multiselect>
    </div>
    <!-- <p>hola</p> -->
</template>

<script>

import Multiselect from 'vue-multiselect';

export default {
    components: {
        Multiselect
    },
    data () {
        return {
            value: [],
            teams: [],
            isLoading: false,
            placeholder: "Seleccione un equipo"
        }
    },
    props: {
        edit: true,
        teamSelected: 0,
        instance: 0
    },
    watch:{
        teamSelected:{
            handler: function (values) {
                this.value = values;
            },
            immediate: true,
        },
        instance: {
            immediate: true,
            handler: 'fetchData'
        }
    },
    methods: {
        clearAll() {
            this.teams = []
        },
        onChange() {
            this.$emit('changed', this.value);
        },
        contentReady() {
            if (this.edit) {
                this.placeholder = "Seleccione un equipo";
            } else {
                this.placeholder = "Seleccione uno o más equipos";
            }
        },
        fetchData() {
            this.isLoading = true;
            this.placeholder = "Recuperando equipos, por favor aguarde..."
            let url="/api/teams"
            if (this.instance != 0) {
                url = "api/instances/" + this.instance + "/teams"
            }
            axios.get(url)
                .then(response => { 
                    
                    this.teams = Object.values(response.data); 
                    //teams.sort(compareByName);
                    this.contentReady();
                    
                })
                .catch(error => this.placeholder = "No se pudo recuperar el listado de equipos")
                .finally(() => this.isLoading = false);

        }
    }

}

</script>

<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>