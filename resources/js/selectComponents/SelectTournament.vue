<template>
    <div class="field"> 
        <label class="label" for="selectTournament">Torneo</label>
        <multiselect id="selectTournament" 
            :loading="isLoading"
            v-model="value"
            track-by="id"
            label="name"
            :placeholder="placeholder"
            :options="tournaments" 
            :searchable="true"
            :multiple="!edit"
            :close-on-select="edit"
            @input="onChange">
        </multiselect>
    </div>
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
            tournaments: [],
            isLoading: false,
            placeholder: "Seleccione un torneo"
        }
    },
    props: {
        edit: true,
        tournamentSelected: Object
    },
    watch:{
        tournamentSelected:{
            handler: function (newTournament) {
                //console.log('entré a tournamentChanged con ' + newId);
                this.value = newTournament;
            },
            deep: true,
        },
    },
    methods: {
        clearAll() {
            this.tournaments = []
        },
        onChange() {
            this.$emit('changed', this.value);
        },
        contentReady() {
            if (this.edit) {
                this.placeholder = "Seleccione un torneo";
            } else {
                this.placeholder = "Seleccione uno o más torneos";
            }
        }
    },
    
    mounted() {
        this.isLoading = true;
        this.placeholder = "Recuperando torneos, por favor aguarde..."
        axios.get('/api/tournaments')
            .then(response => { 
                this.tournaments = response.data;
                this.contentReady();
            })
            .catch(error => this.placeholder = "No se pudo recuperar el listado de torneos")
            .finally(() => this.isLoading = false);
        

    }

}

</script>

<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>