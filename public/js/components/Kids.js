import CartoonMusicRowComponent from "./CartoonMusicRowComponent.js";
import CartoonVedioRowComponent from "./CartoonVedioRowComponent.js";
export default {
  name: 'kids',
  template: `<div class="list-page-wrap kids-page-wrap">
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
            <li class="icon-item" v-for="(item, index) in kidsIcon" :key="index" @click="tabClick(item.type)">
                <div class="icon-pic">
                    <img :src="item.url" />            
                </div>
            </li>
        </ul>
        <div v-if="type != 'music'">
          <dl class="video-list video-list-keep">
              <dt class="v-l-title">Trending Now</dt>
              <CartoonVedioRowComponent :mediaList="cartoonAllList"></CartoonVedioRowComponent>
          </dl>
          <dl class="video-list video-list-rec" v-for="item in cartoonList">
              <dt class="v-l-title">{{item.genre_name}}</dt>
              <CartoonVedioRowComponent :mediaList="item.cartoons"></CartoonVedioRowComponent>
          </dl>
        </div>
        <div v-if="type == 'music'">
          <dl class="video-list video-list-keep">
            <dt class="v-l-title">Trending Now</dt>
            <CartoonMusicRowComponent :mediaList="musicAllList"></CartoonMusicRowComponent>
          </dl>
          <dl class="video-list video-list-rec" v-for="item in musicList">
              <dt class="v-l-title">{{item.genre_name}}</dt>
              <CartoonMusicRowComponent :mediaList="item.movies"></CartoonMusicRowComponent>
          </dl>
        </div>
        
    </div>`,
  components: {
    CartoonVedioRowComponent: CartoonVedioRowComponent,
    CartoonMusicRowComponent: CartoonMusicRowComponent
  },
  data () {
    return {
      user: '',
      type: 'tv',
      cartoonAllList: [],
      cartoonList: [],
      musicAllList: [],
      musicList: [],
      kidsIcon: [
        {
          url: '/images/kids_pic1.png',
          type: 'tv'
        },
        {
          url: '/images/kids_pic2.png',
          type: 'film'
        },
        {
          url: '/images/kids_pic3.png',
          type: 'music'
        },
      ]
    }
  },
  created () {
    // this.$emit('authenticated', true, {
    //   pageName: 'kids'
    // })
    // this.user = localStorage.getItem('user')
    // console.info(this.user)
    this.getCartoonList()
    this.getCartoonAllList()
    this.getMusicAllList()
    this.getMusicList()
  },
  methods: {
    tabClick (type) {
      this.type = type
      if (this.type == 'music') {
        return
      }
      this.getCartoonList()
    },
    getCartoonList () {
      let that = this;
      fetch('/cartoon/list?type=' + that.type, {
        method: 'get'
      })
        .then(res => res.json())
        .then(result => {
          console.info(result)
          if (result.success) {
            that.cartoonList = result.data
          } else {
            alert(result.msg)
          }
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    getCartoonAllList () {
      let that = this;
      fetch('/cartoon/all', {
        method: 'get'
      })
        .then(res => res.json())
        .then(result => {
          console.info(result)
          if (result.success) {
            that.cartoonAllList = result.data
          } else {
            alert(result.msg)
          }
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    getMusicAllList () {
      let that = this;
      fetch('/cartoonMusic/all', {
        method: 'get'
      })
        .then(res => res.json())
        .then(result => {
          console.info(result)
          if (result.success) {
            that.musicAllList = result.data
          } else {
            alert(result.msg)
          }
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    getMusicList () {
      let that = this;
      fetch('/cartoonMusic/list', {
        method: 'get'
      })
        .then(res => res.json())
        .then(result => {
          console.info(result)
          if (result.success) {
            that.musicList = result.data
          } else {
            alert(result.msg)
          }
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    toDetailPage (id, type) {
      console.info(id)
      console.info(type)
      this.$router.push({ path: "/detail", query: { id: id, type: type, source: 'cartoon' } }).catch(err => { });
    }
  }
}