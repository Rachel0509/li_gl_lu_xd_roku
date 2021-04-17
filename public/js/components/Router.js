import LoginComp from "./LoginComp.js";
import SignUp from "./SignUp.js";
import WelCome from "./WelCome.js";
import Choose from "./Choose.js";
import List from "./List.js";
import Kids from "./Kids.js";
import Detail from "./Detail.js";


let router = new VueRouter({
  routes: [
    { path: '/', redirect: { name: "login" } },
    { path: '/login', name: 'login', component: LoginComp },
    { path: '/register', name: 'register', component: SignUp },
    { path: '/choose', name: 'choose', component: Choose },
    { path: '/welcome', name: 'welcome', component: WelCome },
    { path: '/list', name: 'list', component: List },
    { path: '/kids', name: 'kids', component: Kids },
    { path: '/detail', name: 'detail', component: Detail }
  ]
});



export default router