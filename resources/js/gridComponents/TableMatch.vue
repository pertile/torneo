<template>
    <div ref="matchesTable"></div>
</template>

<script>
var Tabulator = require("tabulator-tables");

import "tabulator-tables/dist/css/tabulator.min.css";

var editIcon  = function(cell, formatterParams){ //plain text value
    return "<i class='fa fa-edit'></i>";
};

export default {
    data: function() {
        return {
            tabulator: null,
            tableData: [],
            options: {
                
            },
            isBusy: false
        }
    },
    props: {
        tournament: 0,
        matchUpdated: {}
    },
    watch:{
        tournament: {
            handler: function(newTournament) {
                this.tabulator.replaceData("/api/tournaments/" + newTournament + "/matches");
            }
        },
        matchUpdated: {
            handler: function(newMatch) {
                this.tabulator.updateData([newMatch]);
            }
        }
    },
    mounted() {
        let matchTable = this;

        this.tabulator = new Tabulator(this.$refs.matchesTable, {
            index: "id",
            locale: true,
            height:"400px",
            responsiveLayout:"collapse",
            //ajaxProgressiveLoad:"load",
            tooltips: true,
            ajaxURL: "/api/matches",
            responsiveLayoutCollapseStartOpen:false,
            langs:{
                "es":{
                    "pagination":{
                        "first":"Primera",
                        "first_title":"Primera página",
                        "last":"Última",
                        "last_title":"Última página",
                        "prev":"Anterior",
                        "prev_title":"Página anterior",
                        "next":"Siguiente",
                        "next_title":"Página siguiente"
                    }
                }
            },
            columns: [
                {title:"+", formatter:"responsiveCollapse", headerSort:false},
                {title:"", formatter:editIcon, width:25, align:"center", headerSort:false, cellClick:function(e, cell){
                    matchTable.$emit('editMatch', cell.getRow().getData());
                }},
                {title:"ID", field:"id", headerFilter:true},
                {title:"Instancia", field: 'instance.name', headerFilter:true},
                {title:"Local", field:"home_team.name", headerFilter:true},
                {title:"Marcador", field:"home_score", align:"right"},
                {title:"Jugó", field:"home_played", formatter:"tickCross", formatterParams:{
                    allowEmpty:true
                }},
                {title:"Puntos", field:"home_points", align:"right"},
                {title:"Visitante", field:"away_team.name", headerFilter:true},
                {title:"Marcador", field:"away_score", align:"right"},
                {title:"Jugó", field:"away_played", formatter:"tickCross", formatterParams:{
                    allowEmpty:true
                }},
                {title:"Puntos", field:"away_points", align:"right"},
                {title:"Fecha", field:"date", sorter:"date", align:"center", formatter:"datetime", formatterParams:{
                    inputFormat:"YYYY-MM-DD",
                    outputFormat:"DD/MM/YYYY",
                    invalidPlaceholder:"(fecha inválida)",
                }},
                {title:"Observaciones", field:"note"}
            ]
        });
    }
}
</script>