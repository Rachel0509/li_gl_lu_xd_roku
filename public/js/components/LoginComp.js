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
                    <a class="to-signup" >Sign up</a>
                </div>
            </div>
        </div>
    `,

  data () {
    return {
      logins: {
        email: "",
        password: ""
      },
      formMsg: ""
    }
  },
  created () {
    // this.$emit('authenticated', true, {
    //   pageName: 'login'
    // })

  },
  methods: {
    toRegister () {
      this.$router.push({ path: "/register" });
    },
    signin () {
      if (this.logins.email != "" && this.logins.password != "") {
        fetch('/login', {
          method: 'POST',
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(this.logins),
        })
          .then(res => res.json())
          .then(result => {
            console.info(result);
            if (result.success) {

				var userIdList=[];
				var mainId="";
				var data=result.data;
				console.log(data);
				for (var idx in data ){
						console.info(data[idx]);
						userIdList.push(data[idx].user_id);
						localStorage.setItem("user"+data[idx].user_id, JSON.stringify(data[idx]));
						if(!data[idx].main_user_id){
							mainId=data[idx].user_id;
						}
				}
				localStorage.setItem("mainId", mainId);
				localStorage.setItem("userIdList", JSON.stringify(userIdList));

              this.$router.push({ path: "/welcome" });
            } else {
              alert(result.msg)
            }
          })
          .catch(function (error) {
            console.log(error);
          });
      }
    }
  }
}
