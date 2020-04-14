<template>
    <b-table :data="data">
        <template slot-scope="props">

            <b-table-column field="date" label="Fecha" numeric>
                {{ props.row.date?new Date(props.row.date).toLocaleDateString():'' }}
            </b-table-column>

            <b-table-column field="homeShield" label="" width="40">
                <figure class="image is-32x32" style="float:left" v-if="props.row.homeShield">
                    <img :src="'storage/' + props.row.homeShield " >
                </figure>
            </b-table-column>
            
            <b-table-column field="homeName" label="Local">
                {{ props.row.homeName }}
            </b-table-column>

            <b-table-column field="home_score" label="GL" numeric width="40">
                <template slot="header" slot-scope="{ column }">
                    <b-tooltip label="Goles del equipo local" position="is-bottom" dashed>
                        GL
                    </b-tooltip>
                </template>
                {{ props.row.home_score }}
            </b-table-column>

            <b-table-column field="home_points" label="PL" width="30">
                <template slot="header" slot-scope="{ column }">
                    <b-tooltip label="Puntos del equipo local" position="is-bottom" dashed>
                        PL
                    </b-tooltip>
                </template>
                {{ props.row.home_points?'(' + props.row.home_points + ')':'' }}
            </b-table-column>

            <b-table-column field="" label=" " width="10" centered>-</b-table-column>
            
            <b-table-column field="away_points" label="PV" width="30">
                <template slot="header" slot-scope="{ column }">
                    <b-tooltip label="Puntos del equipo visitante" position="is-bottom" dashed>
                        PV
                    </b-tooltip>
                </template>{{ props.row.away_points?'(' + props.row.away_points + ')':'' }}
            </b-table-column>
            
            <b-table-column field="away_score" label="GV" numeric width="40">
                <template slot="header" slot-scope="{ column }">
                    <b-tooltip label="Goles del equipo visitante" position="is-bottom" dashed>
                        GV
                    </b-tooltip>
                </template>{{ props.row.away_score }}
            </b-table-column>

            <b-table-column field="awayShield" label="  " width="40">
                <figure class="image is-32x32" style="float:left" v-if="props.row.awayShield">
                    <img :src="'storage/' + props.row.awayShield " >
                </figure>
            </b-table-column>
 
            <b-table-column field="awayName" label="Visitante">
                {{ props.row.awayName }}
            </b-table-column>
        </template>
    </b-table>
</template>

<script>
export default {
    data() {
        return {
            data: []
        }
    },
    props: {
        instanceId: 0,
        teamId: 0
    },
    watch: {
        instanceId: {
            immediate: true,
            deep: true,
            handler: function(newId) {
                //alert('entré');
                this.setData();
            }
        },
        teamId: {
            immediate: true,
            deep: true,
            handler: function(newId) {
                //alert('entré');
                this.setData();
            }
        },

    },
    methods: {
        setData: function() {
            axios.get('/api/instances/' + this.instanceId + '/teams/' + this.teamId + '/matches')
                .then(response => {
                    this.data = response.data;
                })
                .catch(error => {
                    this.$buefy.toast.open({
                        message: 'Error al obtener el fixture: ' + error.message,
                        type: 'is-danger'
                    })
                });
        }
    }
}
</script>