import VedioRowComponent from "./VedioRowComponent.js";
import MusicRowComponent from "./MusicRowComponent.js";
export default {
  name: 'list',
  template: `<div class="list-page-wrap">
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
                    <li :class="[item.key== type ? 'active': '']" v-for="item in tabList" @click="tabClick(item.key)">{{item.name}}</li>
                </ul>
                <div class="search-wrap">
                  <div class="search">
                    <input placeholder="SEARCH YEAR" v-model="searchName"/>
                    <img src="images/search.png" @click="searchClick"/>
                  </div>
                </div>
            </div>
            <div class="tab-b" v-if="type != 'music'">
                <dl class="video-list video-list-keep">
                    <dt class="v-l-title">Recommended</dt>
                    <VedioRowComponent :mediaList="movieAllList"></VedioRowComponent>
                </dl>
                <dl class="video-list video-list-rec" v-for="item in timesList" >
                    <dt class="v-l-title">{{item.time_name}}</dt>
                    <VedioRowComponent :mediaList="item.movies"></VedioRowComponent>
                </dl>
            </div>
            <div class="tab-b" v-if="type == 'music'">
                <dl class="video-list video-list-keep">
                    <dt class="v-l-title">Recommended</dt>
                    <MusicRowComponent :mediaList="musicAllList"></MusicRowComponent>
                </dl>
                <dl class="video-list video-list-rec" v-for="item in musicList" >
                    <dt class="v-l-title">{{item.genre_name}}</dt>
                    <MusicRowComponent :mediaList="item.movies"></MusicRowComponent>
                </dl>
            </div>
        </div>
    </div>`,
  components: {
    VedioRowComponent: VedioRowComponent,
    MusicRowComponent: MusicRowComponent
  },
  data () {
    return {
      allMoveRight: 0,
      type: 'film',
      timesList: [],
      movieAllList: [],
      musicList: [],
      musicAllList: [],
      user: '',
      searchName: '',
      tabList: [
        { name: 'Movies', key: 'film' },
        { name: 'TV Shows', key: 'tv' },
        { name: 'Music', key: 'music' }
      ]
    }
  },
  created () {
    this.getTimeList()
    this.user = localStorage.getItem('currentUserId')
    this.getMovieAllList()
    this.getMusicAllList()
    this.getMusicList()
  },
  methods: {
    searchClick(){
      this.getTimeList()
      this.getMusicList()
    },
    tabClick (type) {
      this.type = type
      if (this.type == 'music') {
        return
      }
      this.getTimeList()
    },
    getTimeList () {
      let that = this;
      fetch('/times/list?type=' + that.type+"&searchName="+this.searchName, {
        method: 'get'
      })
        .then(res => res.json())
        .then(result => {
          console.info(result)
          if (result.success) {
            that.timesList = result.data
          } else {
            alert(result.msg)
          }
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    getMovieAllList () {
      let that = this;
      fetch('/movies/all', {
        method: 'get'
      })
        .then(res => res.json())
        .then(result => {
          console.info(result)
          if (result.success) {
            that.movieAllList = result.data
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
      fetch('/music/all', {
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
      fetch('/music/list?searchName='+this.searchName, {
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
    }
  }
}