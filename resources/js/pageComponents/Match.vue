<template>
    <div>
        
        <select-tournament @changed="tournamentSelected" :edit="true"/>
        <table-match ref="tableMatch" :tournament="tournament" :matchUpdated="matchUpdated" @editMatch="editMatch" />
    </div>
</template>

<script>
import SelectTournament from '../selectComponents/SelectTournament';
import TableMatch from '../gridComponents/TableMatch';
import EditMatch from '../formComponents/EditMatch';

export default {
    components: {SelectTournament, TableMatch, EditMatch},
    data: function() {
        return {
            tournament: 0,
            showEditMatch: false,
            matchId: 0,
            matchUpdated: {}
        }
    },
    methods: {
        tournamentSelected: function(value) {
            this.tournament = value.id;
        },
        matchEdited: function(match) {
            //this.showEditMatch = false;
            this.matchUpdated = match;
            this.$buefy.toast.open({
                message: 'Partido modificado',
                type: 'is-success'
            });
        },
        editMatch: function(value) {
            
            // if (this.$can('edit_matches')) {
                this.matchId = value.id;
                this.showEditMatch = true;
                
                let modalProps = {
                    matchId: this.matchId,
                    isActive: true
                };
    
                this.$buefy.modal.open({
                    parent: this,
                    component: EditMatch,
                    props: modalProps,
                    events: {
                        'completed': value => {
                            this.matchEdited(value);
                        }
                    }
                });
            // } else {
            //     this.$buefy.toast.open({
            //         message: 'No tiene permiso para editar partidos'
            //     });
            // }


        }

    }
}
</script>