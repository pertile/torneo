<template>
    <div>
        <select-instance v-model="instance" @changed="instanceChanged"/>
        <b-field label="Fecha">

            <date-picker v-model="date" :max-date='new Date()'
                :popover="{ placement: 'bottom', visibility: 'click' }"
                locale="es"/>
                
        </b-field>
        <table-standings :instanceId="instanceId" :date="date"/>
    </div>
</template>

<script>
import SelectInstance from '../selectComponents/SelectInstance';
import TableStandings from '../gridComponents/TableStandings';
import DatePicker from 'v-calendar/lib/components/date-picker.umd';


export default {
    components: {SelectInstance, TableStandings, DatePicker},
    data: function() {
        return {
            date: new Date(),
            instance: {},
            instanceId: 3
        }
    },
    methods: {
        instanceChanged: function(newInstance) {
            this.instanceId = newInstance.id;
        }
    }
}
</script>