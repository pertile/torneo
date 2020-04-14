<template>
    <form @submit.prevent="onSubmit">
        <div class="mmodal-card" style="width: auto">
            <header class="modal-card-head">
                <p class="modal-card-title">Editar una incidencia ({{ this.incidentId }})</p>
            </header>
            <section class="modal-card-body">

                <p class="control">
                    <div class="field">
                        <label for="" class="label">Torneo: {{ form.instance.tournament.name }}</label>
                    </div>
                    <div class="field">
                        <label for="" class="label">Instancia: {{ form.instance.name }}</label>
                    </div>
                    <div class="field">
                        <select-team :edit="true" :teamSelected="form.team" :instance="instanceId"
                            @changed="teamChanged"/>
                    </div>
                    <b-field label="Puntos" :message="form.errors.get('points')"
                        type="form.errors.get('points')?'is-danger':''" >
                        
                        <b-numberinput id="points" v-model="form.points"
                            min="-99" max="99" size="3" @input="form.errors.clear('points')" />
                        
                    </b-field>
                    <b-field label="Fecha" :message="form.errors.get('date')" 
                        :type="form.errors.get('date')?'is-danger':''" >
                        
                        <date-picker id="date" v-model="form.date"
                                :popover="{ placement: 'bottom', visibility: 'click' }"
                                @input="form.errors.clear('date')" />

                    </b-field>
                    <b-field label="Observaciones" :message="form.errors.get('note')"
                        :type="form.errors.get('note')?'is-danger':''" >
                        <textarea class="textarea" id="note" v-model="form.note"
                                @input="form.errors.clear('note')" />
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
import SelectTeam from '../selectComponents/SelectTeam'

export default {
    components: {DatePicker, SelectTeam},
    
    data: function() {
        return {
            form: new Form({ 
                id: '',
                tournament: {},
                team: {},
                instance: {},
                points: 0,
                date: '',
                note: ''
            }),
            instanceId: 0
        }
    },
    props: {
        incidentId: 0
    },
    methods: {
        onSubmit() {
            let incident2 = {};
            Object.assign(incident2, this.form);
            this.form
                .put('/api/incidents/' + this.incidentId)
                .then(incident => this.$emit('completed', incident2));
        },
        updateData() {
            axios.get('api/incidents/' + this.incidentId)
                .then(response => { 
                    Object.assign(this.form, response.data);
                    this.instanceId = response.data.instance.id;
                    if (response.data.date != null) {
                        this.form.date = moment(response.data.date).toDate();
                    }
                });
        },
        teamChanged(newTeam) {
            this.form.team = newTeam;
        }
    },
    mounted() {
        this.updateData();
    }    
}
</script>