<template>

        <form @submit.prevent="onSubmit">
            <div class="mmodal-card" style="width: auto">
                <header class="modal-card-head">
                    <p class="modal-card-title">Editar un partido ({{ this.matchId }})</p>
                </header>
                <section class="modal-card-body">
                    <p class="control">
                        <div class="field">
                            <b-checkbox v-model="editPoints">Editar manualmente los puntos</b-checkbox>
                        </div>
                        <!-- fila de local  -->
                        <div class="columns is-vcentered">
                            <!-- sección de condición (local o visitante), nombre y escudo -->
                            <div class="column is-half">
                                <div class="columns is-vcentered">
                                    <div class="column">
                                        <p class="title">Local</p>
                                    </div>
                                    <div class="column">
                                        <figure class="image is-32x32" style="float: right">
                                            <img :src="'storage/' + form.home_team.shield">
                                        </figure>
                                    </div>
                                    <div class="column">
                                        <p class="subtitle is-5" id="homeText">{{ form.home_team.name }}</p>
                                    </div>
                                </div>
                            </div>
                            <!-- sección de puntaje -->
                            <div class="column is-half">
                                <div class="columns is-vcentered">
                                    <div class="column is-one-fifth">
                                        <b-field>
                                            <b-checkbox id="homePlayed" v-model="form.home_played"></b-checkbox>
                                        </b-field>
                                    </div>
                                    <div class="column is-two-fifths">
                                        <b-field :message="form.errors.get('home_score')" :type="form.errors.get('home_score')?'is-danger':''">
                                            <b-numberinput id="homeScore" controls-position="compact" v-model="form.home_score" size=3
                                                :disabled="scoreDisabled"
                                                @input="form.errors.clear('home_score')"/>
                                        </b-field>
                                    </div>
                                    <div class="column is-two-fifths">
                                        <b-field :message="form.errors.get('home_points')" 
                                            :type="form.errors.get('home_points')?'is-danger':''">
                                            <b-numberinput id="homePoints"
                                                v-model="form.home_points" min="0" max="2" size="1" 
                                                :disabled="!editPoints"
                                                @input="form.errors.clear('home_points')"/>
                                        </b-field>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- fila de visitante  -->
                        <div class="columns is-vcentered">
                            <!-- sección de condición (local o visitante), nombre y escudo -->
                            <div class="column is-half">
                                <div class="columns is-vcentered">
                                    <div class="column">
                                        <p class="title">Visitante</p>
                                    </div>
                                    <div class="column">
                                        <figure class="image is-32x32" style="float:right">
                                            <img :src="'storage/' + form.away_team.shield">
                                        </figure>
                                    </div>
                                    <div class="column">
                                        <p class="subtitle is-5" id="awayText">{{ form.away_team.name }}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="column is-half">
                                <div class="columns is-vcentered">
                                    <div class="column is-one-fifth">
                                        <b-checkbox id="awayPlayed" type="checkbox" v-model="form.away_played"/>
                                    </div>
                                    <div class="column is-two-fifths">
                                        <b-field :message="form.errors.get('away_score')" 
                                            :type="form.errors.get('away_score')?'is-danger':''">
                                            
                                            <b-numberinput v-model="form.away_score" size=3 
                                                :disabled="scoreDisabled"
                                                @input="form.errors.clear('away_score')"/>                                        
                                        </b-field>
                                    </div>
                                    <div class="column is-two-fifths">
                                        <b-field :message="form.errors.get('away_points')" 
                                            :type="form.errors.get('away_points')?'is-danger':''">
                                            
                                            <b-numberinput id="awayPoints"
                                                v-model="form.away_points" min="0" max="2" size="1"
                                                :disabled="!editPoints"
                                                @input="form.errors.clear('away_points')" />
                                        </b-field>
                                    </div>
                                </div>                                
                            </div>                        
                        </div>
                        <b-field label="Fecha" :message="form.errors.get('date')" 
                            :type="form.errors.get('date')?'is-danger':''" >
                            
                            <div class="control">
                                <date-picker id="dateMatch" v-model='form.date' :max-date='new Date()'
                                    :popover="{ placement: 'bottom', visibility: 'click' }"
                                    locale="es"
                                    @input="form.errors.clear('date')"/>
                            </div>
                        </b-field>
                        <b-field label="Observaciones" :message="form.errors.get('note')" 
                            :type="form.errors.get('note')?'is-danger':''" >
                            <b-input maxlength="200" type="textarea" id="note" v-model="form.note"
                                @input="form.errors.clear('note')"/>
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
        matchId: 0,
        isActive: false
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
                this.updateData();
            },
        deep: true,
        immediate: true
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
                .then(match => { 
                    this.$emit('completed', match2);
                    this.$parent.close();
                });
        },
        updateData() {
            console.log(this.form);
            axios.get('api/matches/' + this.matchId)
                .then(response => { 

                    Object.assign(this.form, response.data);
                    this.form.home_played = response.data.home_played!=0?true:false;
                    this.form.away_played = response.data.away_played!=0?true:false;
                    if (response.data.date != null) {
                        this.form.date = moment(response.data.date).toDate();
                        this.form.home_score = response.data.home_score;
                        this.form.away_score = response.data.away_score;
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