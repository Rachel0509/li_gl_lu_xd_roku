export default {
    name: 'kids',
    template:`<div class="list-page-wrap kids-page-wrap">
        <div class="banner-box">
            <img src="/images/kids_banner.jpg"/>
            <span class="btn btn-play">
                <img src="/images/play_btn.png" />
            </span>
            <span class="btn btn-more">
                <img src="/images/more_btn.png" />
            </span>
        </div>
        <ul class="kids-icon-box">
            <li class="icon-item" v-for="(item, index) in kidsIcon" :key="index">
                <div class="icon-pic">
                    <img :src="item.url" />            
                </div>
            </li>
        </ul>
        <dl class="video-list video-list-keep">
            <dt class="v-l-title">Keep Watching</dt>
            <dd class="v-l-body">
                <ul class="v-list">
                    <li class="l-item" v-for="(item, index) in keepList" :key="index">
                        <div class="item-pic">
                            <img :src="item.url" />
                        </div>
                        <div class="item-look">
                            <span :style="{width: item.w}"></span>
                        </div>
                    </li>
                </ul>
            </dd>
        </dl>
        <dl class="video-list video-list-now">
            <dt class="v-l-title">Trending Now</dt>
            <dd class="v-l-body">
                <ul class="v-list">
                    <li class="l-item" v-for="(item, index) in keepList" :key="index">
                        <div class="item-pic">
                            <img :src="item.url" />
                        </div>
                    </li>
                </ul>
            </dd>
        </dl>
        <dl class="video-list video-list-rec">
            <dt class="v-l-title">Recommend</dt>
            <dd class="v-l-body">
                <ul class="v-list">
                    <li class="l-item" v-for="(item, index) in keepList" :key="index">
                        <div class="item-pic">
                            <img :src="item.url" />
                        </div>
                    </li>
                </ul>
            </dd>
        </dl>
    </div>`,
    data(){
        return {
            keepList:[
                {
                    url: '/images/cartoon1.jpg',
                    w: '20%'
                },
                {
                    url: '/images/cartoon3.jpg',
                    w: '10%'
                },
                {
                    url: '/images/cartoon4.png',
                    w: '70%'
                },
                {
                    url: '/images/cartoon5.jpeg',
                    w: '40%'
                },
                {
                    url: '/images/cartoon1.jpg',
                    w: '25%'
                },
                {
                    url: '/images/cartoon5.jpg',
                    w: '80%'
                },
            ],
            kidsIcon:[
                {
                    url: '/images/kids_pic1.png',
                },
                {
                    url: '/images/kids_pic2.png',
                },
                {
                    url: '/images/kids_pic3.png',
                },
            ]
        }
    },
    created(){
        this.$emit('authenticated', true, {
            pageName: 'kids'
        })
    },
    methods: {

    }
}