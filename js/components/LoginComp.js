export default {
    name: 'signin',
    template: `
        <div class="signInCon">
            <h2>Welcome Flashback!</h2>
            <h4>Get up your favorite...</h4>
            <div class="form-box">
                <strong class="t-t">Sign In</strong>
                <div class="box-inner">
                    <form @submit.prevent="signin" class="form">
                        <div class="formCol">
                            <label for="email">Email</label>
                            <input v-model="logins.email" name="email" type="email" id="email" required>
                    
                            <label for="password">Password</label>
                            <input v-model="logins.password" name="password" type="password" id="password" required>
                            <div class="forget-pass">
                                <a href="#">Forgot your password?</a>
                            </div>
                        </div>
                        <div class="submit-btn">
                            <input type="submit" name="submit" value="SIGN IN">
                        </div>
                    </form>
                    <p class="tip-1">This page is protected by Google reCAPTCHA to ensure you're not a bot. Learn more.</p>
                    <p class="tip-2">Don't have Flashback accouont? </p>
                    <a v-on:click.prevent="switchBtn" href="#homeOption" class="to-signup">Sign up</a>
                </div>
            </div>
        </div>
    `,

    data() {
        return {
            logins: {
                email: "",
                password: ""
            },
            formMsg: ""
        }
    },
    created(){
        this.$emit('authenticated', true, {
            pageName: 'login'
        })
    },
    methods: {
        switchBtn() {
           
        },
        signin() {
            if(this.logins.email != "" && this.logins.password != "") {
                let formData = new FormData();
                formData.append("email", this.logins.email);
                formData.append("password", this.logins.password);
                this.$router.replace({name: "welcome"});
            }
        }
    }
}
