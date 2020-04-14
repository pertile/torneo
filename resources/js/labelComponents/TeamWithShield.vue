<template>
    <div>
        <figure class="image is-128x128">
            <img :src="team.shield">
        </figure>
        <label>{{ team.name }}</label>
    </div>
</template>

<script>
export default {
    data() {
        return {

        }
    },
    props: {
        team: {
            name: '',
            shield: ''
        }
    },
    mounted() {

    }
}
</script>