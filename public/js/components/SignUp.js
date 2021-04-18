export default {
  name: 'signup',
  template: `
        <div class="signInCon">
            <h2>Welcome Flashback!</h2>
            <h4>Get up your favorite...</h4>
            <div class="form-box">
                <strong class="t-t">Sign Up</strong>
                <div class="box-inner">
                    <form @submit.prevent="signup" class="form">
                        <div class="formCol">
                            <label for="username">Username</label>
                            <input v-model="logins.username" name="username" type="text" id="username" required>
                            <label for="email">Email</label>
                            <input v-model="logins.email" name="email" type="email" id="email" required>
                    
                            <label for="password">Password</label>
                            <input v-model="logins.password" name="password" type="password" id="password" required>
                        </div>
                        <div class="submit-btn">
                            <input type="submit" name="submit" value="SIGN UP">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    `,

  data () {
    return {
      logins: {
        username: "",
        email: "",
        password: ""
      },
      formMsg: ""
    }
  },
  created () {
  },
  methods: {
    signup () {
      if (this.logins.email != "" && this.logins.password != "" && this.logins.username != "") {
        fetch('/register', {
          method: 'POST',
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(this.logins),
        })
          .then(res => res.json())
          .then(data => {
            this.$router.push({ path: "/login" });
            console.info(data)
          })
          .catch(function (error) {
            console.log(error);
          });
      }
    }
  }
}
