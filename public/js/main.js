
import router from './components/Router.js';

(() => {

  const vm = new Vue({
    data: {
      authenticated: false,
      administrator: false,
      user: '',
      permission: '',
      kids: false,
      kidView: false,
      pageName: 'index',
      userName: ''
    },

    created: function () {
      console.info("--------------main-----------")
      console.info( localStorage.getItem('mainId'))
      if (! localStorage.getItem('mainId')) {
        this.$router.push({ path: "/" }).catch(err => { });
      } else {
        this.user =  localStorage.getItem('mainId');
        console.info(this.user)
      }
      if (this.permission == 1) {
        this.kids = true;
      } else {
        this.kids = false;
      }

    },
    methods: {
      setAuthenticated (status, data) {
        this.authenticated = status;
        console.log(data)
        this.pageName = data.pageName;
      },
      toLogin () {
        console.log('signed out!');
        localStorage.clear();
        this.$router.push({ path: "/" });
        this.authenticated = false;
        this.administrator = false;
        this.currentUser = '';
        this.permission = '';
        this.kids = false;
        this.user = [];
      }
    },
    router
  }).$mount('#app');

})();
