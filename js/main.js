
import router from './components/Router.js';

(() => {

    const vm = new Vue({
        router,

        data: {
          authenticated: false,
          administrator: false,
          user: [],
          permission: '',
          kids: false,
          kidView: false,
          pageName: 'index'
        },
    
        created: function () {
            
            if(localStorage.getItem('user')) {
                this.$router.push({ path: "/login" });
            }
            if(this.permission == 1) {
                this.kids = true;
            } else {
                this.kids = false;
            }
            
        },
        methods: {
            setAuthenticated(status, data) {
                this.authenticated = status;
                console.log(data)
                this.pageName = data.pageName;
            }
        },
    
        router
      }).$mount('#app');

})();
