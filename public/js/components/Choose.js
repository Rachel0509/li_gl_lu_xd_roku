export default {
  name: 'choose',
  template: `<div class="welcome-wrap">
        <div>
           <h2>Choose your Avatar?</h2>
        </div>
        <div class="inner">
            <ul class="list">
                <li :class="['list-item',item.name== selectName ? 'selected': '']" v-for="item in avatars" @click="itemSelected(item.name)">
                    <div class="item-pic">
                        <img :src="item.url" />
                    </div>
                    <div class="item-name">{{item.name}}</div>
                </li>
                
            </ul>
            <div class="roku-form">
                <form  @submit.prevent="saveForm">
                  <div class="formCol">
                    <input type="text" class="form-input" name="userName"  v-model="personForm.userName" required>
                    <div class="input_check_row">
                      <input type="checkbox"  class="form-checkbox"  name="userType"  v-model="personForm.userType" >
                      <span>kids? </span>
                    </div>
                  </div>
                  <div class="formCol" :style="{display:inputDisplay}">
                    <input v-model="personForm.password" name="password" type="password" id="password" >
                  </div>
                  <div class="formCol"  :style="{display:inputDisplay}">
                    <input type="email" class="form-input" name="email"  v-model="personForm.email" disabled>
                  </div>
                  <div class="btn-area">
                    <input type="hidden"  name="mainId" v-model="personForm.mainId">
                    <button type="submit">Save</button>
                    <button type="button" @click="toHomePage">Home</button>
                  </div>
                </form> 
            </div>
            
        </div>
    </div>`,
  data () {
    return {
	  editType:1,
		  inputDisplay:"block",
      personForm: {
        userId: '',
        userName: '',
        password: '',
        email: '',
        avatar: '',
        mainId: '',
        kidsFlag: false,
		userType:false
      },
      avatars: [{
        name: "bird",
        url: "/images/svg/bird.svg"
      }, {
        name: "crocodile",
        url: "/images/svg/crocodile.svg"
      }, {
        name: "puguin",
        url: "/images/svg/puguin.svg"
      }, {
        name: "rhinoceros",
        url: "/images/svg/rhinoceros.svg"
      }],
      selectName: ''
    }
  },
  created () {
    console.info("choose")

	console.log(this.$route.query.type);
	console.log(this.$route.query.userId);

	let type=this.$route.query.type;
	

	if("add"==  type){
			this.editType=2;
			this.personForm.mainId=this.$route.query.userId;
			this.inputDisplay="none";
			return;
	}

	let userid=this.$route.query.userId;

    let user = localStorage.getItem('user'+userid);
    console.info(user)
    if (user) {
      user = JSON.parse(user);
      this.personForm.userId = user.user_id;
      this.personForm.userName = user.user_name;
      this.personForm.password = user.user_pass;
      this.personForm.email = user.user_email;
      this.personForm.avatar = user.avatar;
      this.selectName = user.avatar;
      if (user.userType !== '1') {
        this.personForm.userType=true;
      }
    }
  },
  methods: {
    itemSelected (name) {
      console.info(name)
      this.selectName = name
      this.personForm.avatar = name
    },
    toHomePage () {

		localStorage.setItem("currentUserId", this.personForm.userId);

      if (this.personForm.userType) {
        this.$router.push({ name: 'kids' });
      } else {
        this.$router.push({ name: 'list' });
      }
    },
    saveForm () {
      console.info(this.personForm)

			if(this.editType==2){

							if (this.personForm.userName != "") {
									
								fetch('/user/addSub', {
								  method: 'POST',
								  headers: {
									"Content-Type": "application/json",
								  },
								  body: JSON.stringify(this.personForm),
								})
								  .then(res => res.json())
								  .then(result => {
									console.info(result);
									if (result.success) {
										    let userIdList =JSON.parse(localStorage.getItem('userIdList'));
											userIdList.push(result.data.user_id);
										localStorage.setItem("user"+result.data.user_id, JSON.stringify(result.data));
										localStorage.setItem("userIdList", JSON.stringify(userIdList));
									  alert(result.msg);
									  this.$router.push({ path: "/welcome" });
									} else {
									  alert(result.msg)
									}
								  })
								  .catch(function (error) {
									console.log(error);
								  });

							 }else{
								alert("userName can not be empty!!!");
								return;
							 }

			}else{

						  if (this.personForm.password != "") {
							fetch('/user/edit', {
							  method: 'POST',
							  headers: {
								"Content-Type": "application/json",
							  },
							  body: JSON.stringify(this.personForm),
							})
							  .then(res => res.json())
							  .then(result => {
								console.info(result)
								if (result.success) {
								  localStorage.setItem("user"+this.personForm.userId, JSON.stringify(result.data));
								  alert(result.msg);
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
}