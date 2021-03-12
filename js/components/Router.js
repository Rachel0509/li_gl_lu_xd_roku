import LoginComp from "./LoginComp.js";
import WelCome from "./WelCome.js";
import List from "./List.js";
import Kids from "./Kids.js";

let router = new VueRouter({
    routes: [
        { path: '/', redirect: { name: "login" } },
        { path: '/login', name: 'login', component: LoginComp },
        { path: '/welcome', name: 'welcome', component: WelCome },
        { path: '/list', name: 'list', component: List },
        { path: '/kids', name: 'kids', component: Kids }
    ]
});

export default router