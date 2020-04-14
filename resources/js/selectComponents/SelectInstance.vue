<template>
    <div>
        <div class="field">
            <select-tournament :edit="true" @changed="tournamentChanged"/>
        </div>
        <div class="field">
            <label class="label" for="selectInstance">Instancia</label>
            <multiselect id="selectInstance" 
                :loading="isLoading"
                v-model="value"
                track-by="id"
                label="name"
                :placeholder="placeholder"
                :options="instances" 
                :searchable="true"
                :multiple="multiple"
                :close-on-select="edit"
                :preselect-first="true"
                @input="onChange">
            </multiselect>

        </div>
    </div>
    <!-- <p>hola</p> -->
</template>

<script>

import Multiselect from 'vue-multiselect';
import SelectTournament from '../selectComponents/SelectTournament';

export default {
    components: {
        Multiselect,
        SelectTournament
    },
    data () {
        return {
            value: [],
            instances: [],
            isLoading: false,
            placeholder: "Seleccione una instancia",
            tournament: 0
        }
    },
    props: {
        edit: true,
        instanceSelected: Object,
        multiple: false
    },
    watch:{
        instanceSelected:{
            handler: function (newId) {
                this.value = this.instanceSelected;
            },
            deep: true,
        },
        tournament: {
            immediate: true,
            handler: 'fetchData'
        }
    },
    methods: {
        clearAll() {
            this.instances = []
        },
        onChange() {
            this.$emit('changed', this.value);
        },
        contentReady() {
            if (this.edit) {
                this.placeholder = "Seleccione una instancia";
            } else {
                this.placeholder = "Seleccione una o más instancias";
            }
        },
        fetchData() {
            this.isLoading = true;
            this.value = [];
            this.placeholder = "Recuperando instancias, por favor aguarde..."
            let url="/api/instances"
            
            if (this.tournament != 0) {
                url = "api/tournaments/" + this.tournament + "/instances"
            }
            //console.log(url);
            axios.get(url)
                .then(response => { 
                    
                    this.instances = Object.values(response.data); 
                    //teams.sort(compareByName);
                    this.contentReady();
                    
                })
                .catch(error => this.placeholder = "No se pudo recuperar el listado de instancias")
                .finally(() => this.isLoading = false);

        },
        tournamentChanged(newTournament) {
            this.tournament = newTournament.id;
            this.value = {};
            this.$emit('changed', this.value);
        }
    }

}

</script>

<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>