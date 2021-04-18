export default {
  name: 'list',
  template: `<div class="detail-page-wrap">
  <div class="detail-content-wrap">
    
    <div v-if="type != 'music'">
      <div class="banner-box"  v-if="source != 'cartoon'">
        <div class="movie-video">
          <video v-if="movie.movies_trailer" controls>
              <source :src="'video/' + movie.movies_trailer">
          </video>
        </div>
      </div>
      <div class="banner-box"  v-if="source == 'cartoon'">
        <div class="movie-video">
          <video v-if="movie.cartoon_trailer" controls>
              <source :src="'video/' + movie.cartoon_trailer">
          </video>
        </div>
      </div>
      <div class="movie-info">
        <div class="title">
			<a href="javascript:window.open('http://www.facebook.com/sharer.php?u='+encodeURIComponent(document.location.href)+'&t='+encodeURIComponent(document.title),'_blank','toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=600, height=450,top=100,left=350');void(0)" style="font-size: 14px;margin-right: 50px;"><img src="images/facebook.png" style="margin-right: 4px;height: 30px;padding-bottom: 20px;"></a>
			<a href="javascript:window.open('http://twitter.com/home?status='+encodeURIComponent(document.location.href)+' '+encodeURIComponent(document.title),'_blank','toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=600, height=450,top=100,left=350');void(0)"  style="font-size: 14px;margin-right: 50px;"><img src="images/twitter-square.png" style="margin-right: 4px;height: 30px;padding-bottom: 20px;"></a>
			<a href="javascript:window.open('https://www.pinterest.com/pin/create/button/?url='+encodeURIComponent(document.location.href),'_blank','toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=600, height=450,top=100,left=350');void(0)" onclick="window.open(this.href,'','scrollbars=1,resizable=1,width=600,height=450,top=100,left=350');return false;" style="font-size: 14px;margin-right: 48px;"><img src="images/pinterest.png" style="margin-right: 4px;height: 30px;padding-bottom: 20px;"></a>
		   
		</div> 


        <div v-if="source != 'cartoon'">
          <h3>{{movie.movies_title}}</h3>
        </div> 
        <div v-if="source == 'cartoon'">
          <h3>{{movie.cartoon_title}}</h3>
        </div> 
        <div class="genre">
          <h4>{{movie.genre_name}}</h4>
          <h4 class="score">{{movie.rating}}</h4>
          <h4 class="score">{{movie.arating}}</h4>
        </div>
        <div class="desc">
          <h4>Description</h4>
          <div v-if="source != 'cartoon'">
            {{movie.movies_storyline}}
          </div>
          <div v-if="source == 'cartoon'">
            {{movie.cartoon_storyline}}
          </div>
        </div>
      </div>
      <div class="comment-title"><h4>Comments</h4></div>
		<div class="comment-content">
		   <form @submit.prevent="submitCommon" class="form">
				<div class="formCol">
					<textarea v-model="common" name="common"   id="password" >
					</textarea>
					<input type="submit" name="submit" value="submit">
				</div>
			</form>
		</div>

      <div class="movice-comment">
          <div class="comment-item" v-for="item in commentList">
              <div class="avatar">
                <img :src="item.avatar"/>
              </div>
              <div class="comment-content">
                <div class="name"><h4>{{item.user_name}}</h4></div>
                <div class="content">
                  {{item.comment}}
                </div>
                <div class="time">
                  {{item.times}}
                </div>
              </div>
          </div>
      </div>
    </div>
    <div v-if="type == 'music'">
      <div class="banner-box">
        <div class="img">
          <img :src="'images/'+ movie.music_cover " />
        </div>
        <div class="video">
          <video v-if="movie.music_audio" controls>
              <source :src="'music/' + movie.music_audio">
          </video>
        </div>
      </div>
      <div class="movie-info">
        <div class="title">
				<a href="javascript:window.open('http://www.facebook.com/sharer.php?u='+encodeURIComponent(document.location.href)+'&t='+encodeURIComponent(document.title),'_blank','toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=600, height=450,top=100,left=350');void(0)" style="font-size: 14px;margin-right: 50px;"><img src="images/facebook.png" style="margin-right: 4px;height: 30px;padding-bottom: 20px;"></a>
			  <a href="javascript:window.open('http://twitter.com/home?status='+encodeURIComponent(document.location.href)+' '+encodeURIComponent(document.title),'_blank','toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=600, height=450,top=100,left=350');void(0)"  style="font-size: 14px;margin-right: 50px;"><img src="images/twitter-square.png" style="margin-right: 4px;height: 30px;padding-bottom: 20px;"></a>
			  <a href="javascript:window.open('https://www.pinterest.com/pin/create/button/?url='+encodeURIComponent(document.location.href),'_blank','toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=600, height=450,top=100,left=350');void(0)" onclick="window.open(this.href,'','scrollbars=1,resizable=1,width=600,height=450,top=100,left=350');return false;" style="font-size: 14px;margin-right: 48px;"><img src="images/pinterest.png" style="margin-right: 4px;height: 30px;padding-bottom: 20px;"></a>
	  	</div> 


        <div class="title">
          <h3>{{movie.music_title}}</h3>
        </div> 
        <div class="genre">
          <h4>{{movie.genre_name}}</h4>
          <h4 class="score">{{movie.rating}}</h4>
          <h4 class="score">{{movie.arating}}</h4>
        </div>
        <div class="desc">
          <h4>{{movie.music_artist}}</h4>
        </div>
      </div>
      <div class="comment-title"><h4>Comments</h4></div>
		
		
		<div class="comment-content">
		   <form @submit.prevent="submitCommon" class="form">
				<div class="formCol">
					<textarea v-model="common" name="common"   id="password" >
					</textarea>
					<input type="submit" name="submit" value="submit">
				</div>
			</form>
		</div>


      <div class="movice-comment">
          <div class="comment-item" v-for="item in commentList">
              <div class="avatar">
                <img :src="item.avatar"/>
              </div>
              <div class="comment-content">
                <div class="name"><h4>{{item.user_name}}</h4></div>
                <div class="content">
                  {{item.comment}}
                </div>
                <div class="time">
                  {{item.times}}
                </div>
              </div>
          </div>
      </div>
    </div>
    
  </div>
</div>`,
  data () {
    return {
      movie_id: '',
      type: '',
		  common:"",
      commentList: [],
      movie: {}
    }
  },
  created () {
    this.movie_id = this.$route.query.id
    this.type = this.$route.query.type
    this.source = this.$route.query.source
    this.getMovie()
    this.getCommentList()
  },
  methods: {
    getCommentList () {
      let that = this;
      fetch('/comment?id=' + that.movie_id, {
        method: 'get'
      })
        .then(res => res.json())
        .then(result => {
          console.info(result)
          if (result.success) {
            that.commentList = result.data
          } else {
            alert(result.msg)
          }
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    getMovie () {
      let that = this;
      let url = '/movies';
      if (that.source == 'cartoon') {
        if (that.type == 'music') {
          url = '/cartoonMusic'
        } else {
          url = '/cartoon'
        }
      } else {
        if (that.type == 'music') {
          url = '/music'
        }
      }

      fetch(url + '?id=' + that.movie_id, {
        method: 'get'
      })
        .then(res => res.json())
        .then(result => {
          console.info(result)
          if (result.success) {
            that.movie = result.data
          } else {
            alert(result.msg)
          }
        })
        .catch(function (error) {
          console.log(error);
        });
    },
	submitCommon(){
	
			let userid=localStorage.getItem("currentUserId");

			  fetch('/common/submit', {
				  method: 'POST',
				  headers: {
					"Content-Type": "application/json",
				  },
				  body: JSON.stringify({movieId: this.movie_id,userId:userid,common:this.common}),
				})
				  .then(res => res.json())
				  .then(result => {
					console.info(result);
					if (result.success) {
						alert(result.msg);
						this.common="";

						this.getCommentList() ;


					} else {
					  alert(result.msg);
					}
				  })
				  .catch(function (error) {
					console.log(error);
				  });
	}
  }
}