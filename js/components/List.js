export default {
    name: 'list',
    template:`<div class="list-page-wrap">
        <div class="banner-box">
            <img src="/images/list_banner.jpg"/>
            <span class="btn btn-play">
                <img src="/images/play_btn.png" />
            </span>
            <span class="btn btn-more">
                <img src="/images/more_btn.png" />
            </span>
        </div>
        <div class="tab-box">
            <div class="tab-t">
                <ul>
                    <li class="active">TV Shows</li>
                    <li>Movies</li>
                    <li>Music</li>
                </ul>
            </div>
            <div class="tab-b">
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
            </div>
        </div>
    </div>`,
    data(){
        return {
            keepList:[
                {
                    url: '/images/tvshow2.jpg',
                    w: '20%'
                },
                {
                    url: '/images/tvshow3.jpg',
                    w: '10%'
                },
                {
                    url: '/images/tvshow4.jpg',
                    w: '70%'
                },
                {
                    url: '/images/tvshow5.jpg',
                    w: '40%'
                },
                {
                    url: '/images/tvshow1.jpg',
                    w: '25%'
                },
                {
                    url: '/images/tvshow5.jpg',
                    w: '80%'
                },
            ]
        }
    },
    created(){
        this.$emit('authenticated', true, {
            pageName: 'list'
        });
    },
    methods: {

    }
}