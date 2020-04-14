<template>
    <form @submit.prevent="onSubmit">
        <div class="mmodal-card" style="width: auto">
            <header class="modal-card-head">
                <p class="modal-card-title">Agregar una incidencia</p>
            </header>
            <section class="modal-card-body">
                <p class="control">            
                    <select-instance :edit="true" :instanceSelected="form.instance"
                            :tournament="form.instance" @changed="instanceChanged" />
                    <span class="help is-danger" v-if="form.errors.get('instance')"
                        v-text="form.errors.get('instance')" />                            
                    <select-team :edit="true" :teamSelected="form.team" :instance="form.instance.id"
                        @changed="teamChanged"/>
                    <span class="help is-danger" v-if="form.errors.get('team')"
                        v-text="form.errors.get('team')" />
                    <b-field label="Puntos">
                        <b-numberinput id="points" v-model="form.points"
                            min="-99" max="99" size="3" @input="form.errors.clear('points')" />
                        <span class="help is-danger" v-if="form.errors.get('points')"
                            v-text="form.errors.get('points')"></span>
                    </b-field>
                    <b-field label="Fecha">
                        <date-picker id="date" v-model="form.date"
                                :popover="{ placement: 'bottom', visibility: 'click' }"
                                @input="form.errors.clear('date')" />
                        <span class="help is-danger" v-if="form.errors.get('date')"
                            v-text="form.errors.get('date')"></span>
                    </b-field>
                    <b-field label="Observaciones">
                        <b-input maxlength="200" type="textarea" id="note" v-model="form.note"
                                @input="form.errors.clear('note')" />
                        <span class="help is-danger" v-if="form.errors.get('note')" 
                            v-text="form.errors.get('note')"></span>
                    </b-field>
                </p>
            </section>
            <footer class="modal-card-foot">
                <b-button @click="$parent.close()">Cancelar</b-button>
                <b-button type="is-primary" :disabled="form.errors.any()" @click="onSubmit">Guardar</b-button>
            </footer>
        </div>
    </form>
</template>

<script>
import DatePicker from 'v-calendar/lib/components/date-picker.umd';
import SelectTeam from '../selectComponents/SelectTeam';
import SelectInstance from '../selectComponents/SelectInstance';
import SelectTournament from '../selectComponents/SelectTournament';

export default {
    components: {DatePicker, SelectTeam, SelectInstance, SelectTournament},
    
    data: function() {
        return {
            form: new Form({ 
                id: '',
                team: {},
                instance: {},
                points: 0,
                date: '',
                note: ''
            }),
            tournament: {}
        }
    },
    methods: {
        onSubmit() {
            let incident2 = {};
            let addIncident = this;
            Object.assign(incident2, this.form);
            this.form
                .post('/api/incidents')
                .then( function(response) {
                    //console.log(response);
                    incident2.id = response.id;
                    addIncident.$emit('completed', incident2);
                })
        },
        teamChanged(newTeam) {
            this.form.team = newTeam;
            this.form.errors.clear('team');
        },
        instanceChanged(newInstance) {
            this.form.instance = newInstance;
            this.form.team = {};
            this.form.errors.clear('instance');
        }
    }   
}
</script>