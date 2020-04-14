<template>
    <nav class="navbar">
        <button class="navbar-item" @click="login">Acceder</button>
        <button class="navbar-item">Registrarse</button>
    </nav>
</template>

<script>
import LoginForm from '../loginComponents/Login.vue';
export default {
    components: {
        LoginForm,
    },
    methods: {
        login() {
            this.$buefy.modal.open({
                    parent: this,
                    component: LoginForm,
                    hasModalCard: true,
                    trapFocus: true,
                    events: {
                        'completed': value => {
                            location.reload(true);
                        }
                    }
                });
        }
    },
}
</script>