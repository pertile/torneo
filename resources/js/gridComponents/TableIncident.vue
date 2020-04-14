<template>
    <div ref="incidentsTable" />
</template>

<script>
var Tabulator = require("tabulator-tables");

import "tabulator-tables/dist/css/bulma/tabulator_bulma.min.css";

var editIcon  = function(cell, formatterParams){ //plain text value
    return "<i class='fa fa-edit'></i>";
};

var deleteIcon = function(cell, formatterParams) {
    return "<i class='fa fa-trash'></i>";
}
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
        incidentUpdated: {},
        incidentAdded: {}
    },
    watch:{
        tournament: {
            handler: function(newTournament) {
                this.tabulator.replaceData("/api/tournaments/" + this.tournament + "/incidents");
            }
        },
        incidentUpdated: {
            handler: function(newIncident) {
                this.tabulator.updateData([newIncident]);
            }
        },
        incidentAdded: {
            deep: true,
            handler: function(newIncident) {
                this.tabulator.addData(newIncident);
            }
        }
    },
    mounted() {
        let incidentTable = this;

        this.tabulator = new Tabulator(this.$refs.incidentsTable, {
            index: "id",
            locale: true,
            height:"400px",
            responsiveLayout:"collapse",
            //ajaxProgressiveLoad:"load",
            tooltips: true,
            ajaxURL: "/api/incidents",
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
                {title:"", formatter:editIcon, width:25, align:"center", headerSort:false,
                    cellClick:function(e, cell){
                        incidentTable.$emit('editIncident', cell.getRow().getData());
                }},
                {title:"", formatter:deleteIcon, width:25, align:"center", headerSort:false,
                    cellClick:function(e, cell){
                        let incidentId = cell.getRow().getData().id
                        if  (incidentTable.$can('delete_incidents')) {
                            incidentTable.$buefy.dialog.confirm({
                                message: '¿Está seguro de querer eliminar la incidencia ' + incidentId + '?',
                                cancelText: 'Cancelar',
                                confirmText: 'Eliminar',
                                type: 'is-danger',
                                hasIcon: true,
                                onConfirm: () => {
                                    axios.delete('/api/incidents/' + incidentId)
                                        .then(function (response) {
                                            // handle success
                                            incidentTable.$buefy.toast.open({
                                                message: 'Se eliminó la incidencia ' + incidentId,
                                                type: 'is-success'
                                            });
                                            incidentTable.tabulator.deleteRow(cell.getRow());
                                        })
                                        .catch(function (error) {
                                            console.log(error);
                                            incidentTable.$buefy.toast.open({
                                                message: 'No se pudo eliminar la incidencia ' + incidentId,
                                                type: 'is-danger'
                                            });
                                        });     
                                }
                            });
                        } else {
                            incidentTable.$buefy.toast.open({
                                message: 'No tiene permisos para eliminar una incidencia'
                            });
                        }
                        

                }},

                {title:"ID", field:"id", headerFilter:true},
                {title:"Torneo", field:"instance.tournament.name", headerFilter:true},
                {title:"Instancia", field: 'instance.name', headerFilter:true},
                {title:"Equipo", field:"team.name", headerFilter:true},
                {title:"Puntos", field:"points", align:"right"},
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