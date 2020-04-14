<template>
    <form action="#" method="POST" @submit.prevent="onSubmit">
        <div class="modal-card" style="width: auto">
            <header class="modal-card-head">
                <p class="modal-card-title">Acceder</p>
            </header>
            <section class="modal-card-body">

                <b-field label="Correo electrónico">
                    <b-input
                        type="email"
                        v-model="form.email"
                        placeholder="Su dirección de correo electrónico"
                        required>
                    </b-input>
                </b-field>

                <b-field label="Contraseña" v-if="!forgot">
                    <b-input
                        type="password"
                        v-model="form.password"
                        password-reveal
                        placeholder="Su contraseña"
                        required>
                    </b-input>
                </b-field>

                <b-checkbox v-model="form.remember" v-if="!forgot">Recuérdame</b-checkbox>
                <b-button type="is-text" @click="forgot = !forgot">{{ changeModeText }}</b-button>
            </section>
            <footer class="modal-card-foot">
                <button class="button" type="button" @click="$parent.close()">Cerrar</button>
                <button class="button is-primary" @click="onSubmit">{{ confirmText }}</button>
            </footer>
        </div>
    </form>    
</template>

<script>
export default {
    data() {
        return {
            form: new Form({
                email: '',
                password: '',
                remember: true,
                _token: ''
            }),
            forgot: false
        }
    },
    computed: {
        /* csrf_token() {
            let token = document.head.querySelector('meta[name="csrf-token"]');
            this.form._token = token.content;
            return token.content;
        },*/
        
        confirmText() {
            if (this.forgot) {
                return "Enviar enlace para restablecer contraseña";
            } else {
                return "Acceder";
            }
        },
        
        changeModeText() {
            if (this.forgot) {
                return "Volver a intentar el ingreso";
            } else {
                return "¿Olvidaste tu contraseña?";
            }
        },
        url() {
            if (this.forgot) {
                return "/password/email";
            } else {
                return "/login"
            }
        } 
    },
    methods: {
        onSubmit() {
            let temp = this;
            //console.log(Date.now() + ' ' + this.url);           
            axios.get('/sanctum/csrf-cookie').then(response => {
                //console.log(response);
                this.form
                    .post(this.url)
                    .then(login => { 
                        axios.get('api/instances/3/teams').then(response => {
                            console.log(response);
                        });
                        this.$parent.close();                    
                    })
                    .catch(error => {
                        console.log(error);
                        temp.$buefy.toast.open('Error ' + error);
                    });
            });
        }
    },
}
</script>