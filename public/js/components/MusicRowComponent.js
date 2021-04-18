export default {
  props: ['mediaList'],
  template: `
  <dd class="v-l-body">
    <div class="left" @click="leftMoveClick" v-show="mediaList.length > 8">
      <img src="/images/left.png" />
    </div>
    <ul class="v-list" :style="{width: mediaList.length * 180 + 'px','margin-left': allMoveRight * 180 + 'px'}">
        <li class="l-item" v-for="(item, index) in mediaList" :key="index">
            <div class="item-pic" @click="toDetailPage(item.music_id,'music')">
                <img :src="'images/' + item.music_cover" />
            </div>
        </li>
    </ul>
    <div class="right" @click="rightMoveClick"  v-show="mediaList.length > 8">
      <img src="/images/right.png"/>
    </div>
  </dd>
  `,
  data () {
    return {
      allMoveRight: 0,
    }
  },
  methods: {
    rightMoveClick () {
      console.info(this.mediaList.length + this.allMoveRight)
      console.info(this.allMoveRight)
      if (this.allMoveRight > -(this.mediaList.length - 8)) {
        this.allMoveRight -= 1;
      }
    },
    leftMoveClick () {
      if (this.allMoveRight < 0) {
        this.allMoveRight += 1;
      }
    },
    toDetailPage (id, type) {
      this.$router.push({ path: "/detail", query: { id: id, type: type } }).catch(err => { });
    }
  }

}