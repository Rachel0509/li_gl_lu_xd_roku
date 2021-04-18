export default {
  name: 'welcome',
  template: `<div class="welcome-wrap">
        <h2>Welcome Flashback!</h2>
        <h4>Get up your favorite...</h4>
        <div class="inner">
            <ul class="list">


                <li class="list-item"  v-for="(item,idx) in users" >
                    <div class="item-pic" @click="toListPage(item.userId)">
                        <img :src="item.avatar" />
                    </div>
                    <h4>{{item.userName}}</h4>
					<div class="btn-area">
						<button type="button" @click="toHome(idx)">Home</button>
					</div>
                </li>

            </ul>
            <div class="btn-area">
                <button type="button" @click="addUser">+</button>
            </div>            
	  

        </div>
    </div>`,
  data () {
    return {
      addAvatar: true,
      avatar: '',
      userName: '',
	  mainId:'',
	  users:[]
    }
  },
  created () {
    console.info("welcome")
//location.reload();
	this.mainId= localStorage.getItem('mainId');
	
    let userIdList = JSON.parse(localStorage.getItem('userIdList'));
	
	for(var idx in userIdList){
	
	    var user = localStorage.getItem('user'+userIdList[idx]);
		
		if (user) {
		  user = JSON.parse(user);
		  console.info(user);
		  var addUser= new Object();
			addUser.userType = user.user_type;
			addUser.userName = user.user_name;
			addUser.addAvatar = true;
			addUser.userId=user.user_id;
		  if (user.avatar) {
			addUser.avatar = '/images/svg/' + user.avatar + '.svg';
			addUser.addAvatar = false;
		  }else{
			addUser.avatar = '/images/user_icon.png';
		  }
		  this.users.push(addUser);

		}
	
	}


  },
  methods: {
    toListPage (userid) {
      this.$router.push({ path: '/choose' ,query:{userId:userid}});
    },
    toHome (userIdx) {
		console.log(userIdx);
		console.log(this.users);
		localStorage.setItem("currentUserId", this.users[userIdx].userId);

      if (this.users[userIdx].userType!= '1') {
        this.$router.push({ path: '/kids' });
      } else {
        this.$router.push({ path: '/list' });
      }


    },
	addUser(){
		let userid=this.mainId;
		this.$router.push({ path: '/choose' ,query:{type:"add",userId:userid}});
	},
    toKidsPage () {

    }
  }
}