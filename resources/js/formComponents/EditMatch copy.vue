<template>
    <div class="modal is-active">
        <div class="modal-background"></div>
        <div class="modal-content">
            <div class="message">
                <div class="message-header">
                    Editar un partido ({{ this.matchId }})
                </div>

                <div class="message-body">
                    <form @submit.prevent="onSubmit">
                        <p class="control">

                            <label>
                                <input id="editPoints" type="checkbox" v-model="editPoints"/>
                                Editar manualmente los puntos
                            </label>
                            <label class="label is-medium">Local</label>
                            <div class="columns">
                                <div class="column is-two-fifths" align="right">
                                    <figure class="image is-32x32" style="float:left">
                                        <img :src="'storage/' + form.home_team.shield">
                                    </figure>
                                    <label class="label" id="homeText">{{ form.home_team.name }}</label>
                                </div>
                                <div class="column is-one-fifth">
                                    <input id="homePlayed" type="checkbox" v-model="form.home_played"/>
                                </div>

                                <div class="column is-one-fifth">
                                    <input class="input" id="homeScore" v-model="form.home_score" size=3
                                        :disabled="scoreDisabled"
                                        @input="form.errors.clear('home_score')"/>
                                    <span class="help is-danger" v-if="form.errors.get('home_score')" v-text="form.errors.get('home_score')"></span>
                                </div>
                                <div class="column is-one-fifth">
                                    <input class="input" type="number" id="homePoints"
                                        v-model="form.home_points" min="0" max="2" size="1" 
                                        :disabled="!editPoints"
                                        @input="form.errors.clear('home_points')"/>
                                    <span class="help is-danger" v-if="form.errors.get('home_points')" v-text="form.errors.get('home_points')"></span>
                                </div>
                            </div>
                            <label class="label is-medium">Visitante</label>
                            <div class="columns">
                                <div class="column is-two-fifths" align="right">
                                    <figure class="image is-32x32" style="float:left">
                                        <img :src="'storage/' + form.away_team.shield">
                                    </figure>
                                    <label class="label" id="awayText">{{ form.away_team.name }}</label>
                                </div>
                                <div class="column is-one-fifth">
                                    <input id="awayPlayed" type="checkbox" v-model="form.away_played"/>
                                </div>                        
                                <div class="column is-one-fifth">
                                    <input class="input" id="awayScore" v-model="form.away_score" size=3 
                                        :disabled="scoreDisabled"
                                        @input="form.errors.clear('away_score')"/>
                                    <span class="help is-danger" v-if="form.errors.get('away_score')" v-text="form.errors.get('away_score')"></span>
                                </div>
                                <div class="column is-one-fifth">
                                    <input class="input" type="number" id="awayPoints"
                                        v-model="form.away_points" min="0" max="2" size="1"
                                        :disabled="!editPoints"
                                        @input="form.errors.clear('away_points')">
                                    </input>
                                    <span class="help is-danger" v-if="form.errors.get('away_points')" v-text="form.errors.get('away_points')"></span>
                                </div>
                            </div>
                            <div class="field">
                                <label class="label" for="date">Fecha del partido</label>
                                <div class="control">
                                    <date-picker id="dateMatch" v-model='form.date' :max-date='new Date()'
                                        :popover="{ placement: 'bottom', visibility: 'click' }"
                                        @input="form.errors.clear('date')"/>
                                    <span class="help is-danger" v-if="form.errors.get('date')" v-text="form.errors.get('date')"></span>
                                </div>
                            </div>
                            <div class="field">
                                <label class="label" for="note">Observaciones</label><br>
                                <div class="control">
                                    <textarea class="textarea" id="note" v-model="form.note"
                                        @input="form.errors.clear('note')"/>
                                    <span class="help is-danger" v-if="form.errors.get('note')" v-text="form.errors.get('note')"></span>
                                </div>
                            </div>
                        </p>
                        <p class="control">
                            <button class="button is-primary" :disabled="form.errors.any()">Guardar</button>
                        </p>
                    </form>
                </div>
            </div>
        </div>
        <button class="modal-close is-large" aria-label="close" @click="$emit('close')"></button>
    </div>
</template>

<script>
import TeamWithShield from '../labelComponents/TeamWithShield';
import DatePicker from 'v-calendar/lib/components/date-picker.umd';

export default {
    components: {TeamWithShield, DatePicker},
    
    data: function() {
        return {
            form: new Form({ 
                id: '',
                home_team: {},
                away_team: {},
                home_score: 0,
                away_score: 0,
                home_points: 0,
                away_points: 0,
                home_played: 0,
                away_played: 0,
                date: '',
                note: ''
            }),
            editPoints: false
        }
    },
    props: {
        matchId: 0
    },
    computed: {
        homeResult: function() {
            if (! this.form.home_played) {
                return this.absentPoints;
            } else {
                if (this.form.home_score > this.form.away_score) {
                    return this.wonPoints;
                } else {
                    if (this.form.home_score < this.form.away_score) {
                        return this.lostPoints;
                    } else {
                        return this.drawPoints;
                    }
                }
            }
        },
        awayResult: function() {
            if (! this.form.away_played) {
                return this.absentPoints;
            } else {
                if (this.form.home_score < this.form.away_score) {
                    return this.wonPoints;
                } else {
                    if (this.form.home_score > this.form.away_score) {
                        return this.lostPoints;
                    } else {
                        return this.drawPoints;
                    }
                }
            }
        },
        oneAbsent: function() {
            return this.form.home_played != this.form.away_played;
        },
        twoAbsents: function() {
            return !this.form.home_played && !this.form.away_played;
        },
        twoPlayed: function() {
            return this.form.home_played && this.form.away_played;
        },
        oneAbsentWonScore: function() {
            return this.form.instance.one_absent.split('-')[0];
        },
        oneAbsentLostScore: function() {
            return this.form.instance.one_absent.split('-')[1];
        },
        twoAbsentsScore: function() {
            return this.form.instance.two_absents;
        },
        scoreDisabled: function() {
            return !this.form.home_played || !this.form.away_played;
        },
        wonPoints: function() {
            return this.form.instance==null?0:this.form.instance.won;
        },
        drawPoints: function() {
            return this.form.instance==null?0:this.form.instance.draw;
        },
        lostPoints: function() {
            return this.form.instance==null?0:this.form.instance.lost;
        },
        absentPoints: function() {
            return this.form.instance==null?0:this.form.instance.absent;
        }
    },
    watch:{
        matchId:{
            handler: function (newId) {
                this.matchId = newId;
            },
        deep: true,
        },
        oneAbsent: function(value) {
            if (value) {
                if (this.form.home_played) {
                    this.form.home_score = this.oneAbsentWonScore;
                    this.form.away_score = this.oneAbsentLostScore;
                } else {
                    this.form.home_score = this.oneAbsentLostScore;
                    this.form.away_score = this.oneAbsentWonScore;
                }
            }
        },
        twoAbsents: function(value) {
            if (value) {
                this.form.home_score = this.twoAbsentsScore;
                this.form.away_score = this.twoAbsentsScore;
            }
        },
        twoPlayed: function(value) {
            if (value) {
                this.form.home_score = "";
                this.form.away_score = "";
            }
        },
        homeResult: function(value) {
            if (! this.editPoints) {
                this.form.home_points = value;
            }
        },
        awayResult: function(value) {
            if (! this.editPoints) {
                this.form.away_points = value;
            }
        },
        //para que se vuelva a valores normales si estaba tildado "edición manual" y lo destildo
        editPoints: function(value) {
            if (! value) {
                this.form.away_points = this.awayResult;
                this.form.home_points = this.homeResult;
            }
        }
    },
    methods: {
        onSubmit() {
            let match2 = {};
            Object.assign(match2, this.form);
            this.form
                .put('/api/matches/' + this.matchId)
                .then(match => this.$emit('completed', match2));
        },
        updateData() {
            axios.get('api/matches/' + this.matchId)
                .then(response => { 
                    Object.assign(this.form, response.data);
                    
                    if (response.data.date != null) {
                        this.form.date = moment(response.data.date).toDate();
                    } else {
                        //el jugado empieza tildado porque es lo más común, que el equipo se presente
                        this.form.home_played = true;
                        this.form.away_played = true;
                        //pongo los puntos en cero para que no me quede en blanco, lo cual luego es tomado
                        //como que faltan datos de puntos
                        this.form.home_points = 0;
                        this.form.away_points = 0;
                    }
                });
        }
    },
    mounted() {
        this.updateData();
    }    
}
</script>