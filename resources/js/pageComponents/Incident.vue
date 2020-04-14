<template>
    <div>
        <edit-incident :incidentId="incidentId" v-if="showEditIncident" @completed="incidentEdited"
            @close="showEditIncident = false"/>

        <div class="field">
            <p class="control">
                <button class="button is-primary" @click="addIncident" v-if="$can('add_incidents')">
                    Agregar incidencia
                </button>
            </p>
        </div>
        <div class="field">
            <table-incident ref="tableIncident" :incidentUpdated="incidentUpdated"
                :incidentAdded="newIncident" @editIncident="editIncident" />

        </div>
    </div>
</template>

<script>
import SelectTournament from '../selectComponents/SelectTournament';
import TableIncident from '../gridComponents/TableIncident';
import EditIncident from '../formComponents/EditIncident';
import AddIncident from '../formComponents/AddIncident';

export default {    
    components: {SelectTournament, TableIncident, EditIncident, AddIncident},
    data: function() {
        return {
            showEditIncident: false,
            showAddIncident: false,
            incidentId: 0,
            incidentUpdated: {},
            newIncident: {}
        }
    },
    methods: {
        addIncident: function() {

            this.$buefy.modal.open({
                parent: this,
                component: AddIncident,
                events: {
                    'completed': value => {
                        this.incidentAdded(value);
                    }
                }
            });

        },
        incidentEdited: function(incident) {
            this.showEditIncident = false;
            this.incidentUpdated = incident;
            this.$buefy.toast.open({
                message: 'Incidencia modificada',
                type: 'is-success'
            });
        },
        editIncident: function(value) {
            if (this.$can('edit_incidents')) {
                this.incidentId = value.id;

                let modalProps = {
                    incidentId: this.incidentId,
                };
    
                this.$buefy.modal.open({
                    parent: this,
                    component: EditIncident,
                    props: modalProps,
                    events: {
                        'completed': value => {
                            this.incidentEdited(value);
                        }
                    }
                });
            } else {
                this.$buefy.toast.open({
                    message: 'No tiene permiso para editar incidencias'
                })
            }

        },
        incidentAdded: function(value) {
            this.showAddIncident = false;
            this.newIncident = value;
            console.log(this.newIncident);
            this.$buefy.toast.open({
                message: 'Se agregó una nueva incidencia',
                type: 'is-success'
            });
        }
    }
}
</script>