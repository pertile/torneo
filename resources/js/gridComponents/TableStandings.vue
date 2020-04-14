<template>
    <b-table :data="data">
        <template slot-scope="props">
            <b-table-column field="shield" label="" width="40">
                <figure class="image is-32x32" style="float:left" v-if="props.row.shield">
                    <img :src="'storage/' + props.row.shield " >
                </figure>
            </b-table-column>

            <b-table-column field="name" label="Equipo">
                {{ props.row.name }} <button class="button is-white" @click="openFixture(props.row.team_id)">...</button>
            </b-table-column>

            <b-table-column field="played" label="J" numeric>
                {{ props.row.played }}
            </b-table-column>

            <b-table-column field="Points" label="Pts" numeric>
                {{ props.row.Points }}
            </b-table-column>

            <b-table-column field="Win" label="G" numeric>
                {{ props.row.Win }}
            </b-table-column>

            <b-table-column field="Points" label="P" numeric>
                {{ props.row.Lost }}
            </b-table-column>

            <b-table-column field="ScoreFor" label="GF" numeric>
                {{ props.row.ScoreFor }}
            </b-table-column>

            <b-table-column field="ScoreAgainst" label="GC" numeric>
                {{ props.row.ScoreAgainst }}
            </b-table-column>

            <b-table-column field="ScoreDifference" label="DG" numeric>
                {{ props.row.ScoreDifference }}
            </b-table-column>
            
            <b-table-column field="lastMatches" label="UP">
                <icon-match v-for="match in props.row.lastMatches" 
                    :match="match" :team="props.row.team_id" :key="match.id"/>
            </b-table-column>
        </template>
    
    </b-table>
</template>

<script>
import IconMatch from '../visualComponents/IconMatch';
import TableFixture from '../gridComponents/TableTeamFixture';

export default {
    components: {IconMatch, TableFixture},

    data() {
        return {
            data: []
        }
    },
    props: {
        instanceId: 0,
        date: {}
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
        date: function() {
            this.setData();
        }
    },
    methods: {
        setData: function() {
            axios.get('/api/instances/' + this.instanceId + '/standings/' + moment(this.date).format('YYYY-MM-DD'))
                .then(response => {
                    this.data = response.data;
                })
                .catch(error => {
                    this.$buefy.toast.open({
                        message: 'Error al obtener las posiciones: ' + error.message,
                        type: 'is-danger'
                    })
                });
        },
        openFixture: function(teamId) {
            let modalProps = {
                teamId: teamId,
                instanceId: this.instanceId
            };
  
            this.$buefy.modal.open({
                parent: this,
                component: TableFixture,
                props: modalProps,
                events: {
                    // 'completed': value => {
                    //     this.matchEdited(value);
                    // }
                }
            });
        }
    }
}
</script>