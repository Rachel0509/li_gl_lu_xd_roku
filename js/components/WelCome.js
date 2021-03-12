export default {
    name: 'welcome',
    template: `<div class="welcome-wrap">
        <h2>Welcome Flashback!</h2>
        <h4>Get up your favorite...</h4>
        <div class="inner">
            <ul class="list">
                <li class="list-item">
                    <div class="item-pic" @click="toKidsPage">
                        <img src="/images/welcome_pic.jpg" />
                    </div>
                    <div class="item-name">Name<br/>ChannelType</div>
                </li>
                <li class="list-item" @click="toKidsPage">
                    <div class="item-pic">
                        <img src="/images/welcome_pic.jpg" />
                    </div>
                    <div class="item-name">Name<br/>ChannelType</div>
                </li>
                <li class="list-item" @click="toKidsPage">
                    <div class="item-pic">
                        <img src="/images/welcome_pic.jpg" />
                    </div>
                    <div class="item-name">Name<br/>ChannelType</div>
                </li>
                <li class="list-item add-list-item" @click="toListPage">
                    <div class="item-pic"></div>
                </li>
            </ul>
            <div class="btn-area">
                <button>Back</button>
            </div>
        </div>
    </div>`,
    data(){
        return {
            
        }
    },
    created(){
        this.$emit('authenticated', true, {
            pageName: 'welcome'
        });
    },
    methods:{
        toListPage(){
            this.$router.push({name: 'list'});
        },
        toKidsPage(){
            this.$router.push({name: 'kids'});
        }
    }
}