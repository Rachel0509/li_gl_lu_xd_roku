const express = require('express')
const router = express.Router();

const connect = require("../config/sqlConfig.js");
router.use(express.json());
router.use(express.urlencoded({ extend: false }));

// const { createProxyMiddleware } = require('http-proxy-middleware');

// router.use('/api', createProxyMiddleware({
//     target: 'http://localhost:5000',
//     headers: {
//         accept: 'application/json, application/x-www-form-urlencoded'
//     },
//     changeOrigin: true
// }))

router.get('/', (req, res) => {
  res.render('index', { layout: 'index.hbs' })
})

router.post("/login", (req, res) => {
  const email = req.body.email;
  const password = req.body.password;
  connect.query(`select * from tbl_user where user_email = "${email}" and user_pass = "${password}"`, function (error, rows) {
    if (error) throw error;
    if (rows.length) {
				let mainId=rows[0].user_id;
			   connect.query(`select * from tbl_user where main_user_id = "${mainId}" or  user_id = "${mainId}"`, function (error, allUsers) {
					if (error) throw error;
					 if (rows.length) {
						 res.status(200).json({ success: true, msg: "login success", data: allUsers });
					 }
			  });
    } else {
      res.status(404).json({ success: false, msg: 'user not found' });
    }
  })
});

router.post("/register", (req, res) => {
  const userName = req.body.username;
  const email = req.body.email;
  const password = req.body.password;
  connect.query(`select * from tbl_user where user_email = "${email}" or user_name = "${userName}"`, function (error, rows) {
    if (error) throw error;
    if (rows.length > 0) {
      res.status(404).json({ success: false, msg: 'Username or Email Repeat' });
    } else {
      connect.query(`insert into tbl_user(user_name,user_pass,user_email,user_date) values ("${userName}","${password}","${email}",now())`, function (error, result) {
        if (error) throw error;
        res.status(200).json({ success: true, msg: "register success" });
      });
    }
  })
});

router.post("/user/edit", (req, res) => {
  const userId = req.body.userId;
  const password = req.body.password;
  const kidsFlag = req.body.kidsFlag;
  const userName = req.body.userName;
  const avatar = req.body.avatar;
//  let userType = '1';
//  if (kidsFlag) {
//    userType = 1;
//  }

  let userType = req.body.userType;
  if(userType){
	  userType=2;
  }else{
	  userType=1;
  }

  var modSql = 'update tbl_user set user_pass =? , user_type=?, user_name=? , avatar=? where user_id =?';
  var modSqlParams = [password, userType, userName, avatar, userId];
  connect.query(modSql, modSqlParams, function (error, rows) {
    if (error) throw error;
    connect.query(`select * from tbl_user where user_id ="${userId}"`, function (error, rows) {
      if (error) throw error;
      if (rows.length) {
        res.status(200).json({ success: true, msg: "save success", data: rows[0] });
      } else {
        res.status(404).json({ success: false, msg: 'user not found' });
      }
    });
  });
});


router.post("/common/submit", (req, res) => {
  const movieId = req.body.movieId;
  const userId = req.body.userId;
  const common = req.body.common;
  connect.query(  `INSERT INTO tbl_comments ( user_id, comment, times, movies_id) VALUES ("${userId}", "${common}",now(), "${movieId}")`, function (error, rows) {
    if (error) throw error;
	res.status(200).json({ success: true, msg: "success"});
  });
});

router.post("/user/addSub", (req, res) => {
  const userName = req.body.userName;
  const avatar = req.body.avatar;
  const mainId = req.body.mainId;
  let userType = req.body.userType;
  if(userType){
	  userType=2;
  }else{
	  userType=1;
  }
  connect.query(`select * from tbl_user where user_id = "${mainId}" and main_user_id is null`, function (error, rows) {
    if (error) throw error;
    if (rows.length <1 ) {
      res.status(404).json({ success: false, msg: 'master account is not exist!!!' });
    } else {
		
      connect.query(`insert into tbl_user(user_name,avatar,main_user_id,user_type,user_date,user_pass,user_email) values ("${userName}","${avatar}","${mainId}","${userType}",now(),'${rows[0].user_pass}','${rows[0].user_email}')`, function (error, result) {
        if (error) throw error;
             connect.query(`select * from tbl_user where main_user_id="${mainId}"  and  user_name ="${userName}" `, function (error, rows) {
							 if (error) throw error;
					        res.status(200).json({ success: true, msg: "create success" ,data: rows[0]});
			 });
      });
    }
  })
});



router.get("/movies/all", (req, res) => {
  let movieSql = "SELECT m.* FROM tbl_movies m LEFT JOIN tbl_mov_times mt ON m.movies_id=mt.movies_id LEFT JOIN tbl_times t ON mt.time_id = t.time_id"

  connect.query(movieSql, function (error, mRows) {
    if (error) throw error;
    if (mRows.length > 0) {
      res.status(200).json({ success: true, data: mRows });
    } else {
      res.status(404).json({ success: false, msg: 'times not found' });
    }
  })
});



router.get("/music/all", (req, res) => {
  let movieSql = "SELECT m.* from tbl_music m LEFT JOIN tbl_music_link_genre l ON m.music_id= l.music_id"
  connect.query(movieSql, function (error, rows) {
    if (error) throw error;
    if (rows.length > 0) {
      res.status(200).json({ success: true, data: rows });
    } else {
      res.status(404).json({ success: false, msg: 'times not found' });
    }
  })
});



//router.get("/music/list", (req, res) => {
//  let searchName = req.query.searchName;
//  let sql = "SELECT * FROM tbl_audio_genre order by genre_id";
//  let searchSql = "SELECT m.* from tbl_music m LEFT JOIN tbl_music_link_genre l ON m.music_id= l.music_id where m.music_title like '%?%'"
//  // if(searchName != ''){
//  //   movieSql +=" and m.music_title like '%?%'";
//  // }
//  connect.query(searchSql,[searchName], function (error, rows) {
//    if (error) throw error;
//    if (rows.length > 0) {
////      var musicData = []
////      for (let i = 0; i < rows.length; i++) {
////        let element = rows[i]
////        connect.query(movieSql, [element.genre_id,searchName], function (error, mRows) {
////          if (error) throw error;
////          element.movies = mRows
////          musicData.push(element)
////          if (i == (rows.length - 1)) {
////            res.status(200).json({ success: true, data: musicData });
////          }
////        })
////      }
//		res.status(200).json({ success: true, data: rows });
//    } else {
//      res.status(404).json({ success: false, msg: 'times not found' });
//    }
//  })
//});



router.get("/music/list", (req, res) => {
  let searchName = req.query.searchName;




  let sql = "SELECT * FROM tbl_times order by time_id";
  let movieSql = "SELECT m.*,t.time_id from tbl_music m LEFT JOIN tbl_music_link_time t ON m.music_id=t.music_id where t.time_id=?";
   if(searchName != ''){
     movieSql +=" and m.music_title like '%?%'";
   }
  connect.query(sql, function (error, rows) {
    if (error) throw error;
    if (rows.length > 0) {
      var musicData = [];

//	console.log(rows);
//	console.log(rows.length);

        let element ;
//		element	= rows[0];
//        connect.query(movieSql, [element.genre_id,searchName], function (error, mRows) {
//          if (error) throw error;
//          element.movies = mRows;
//          musicData.push(element);
//          if (0 == (rows.length - 1)) {
//            res.status(200).json({ success: true, data: musicData });
//          }
//        });
//
//        element = rows[1];
//        connect.query(movieSql, [element.genre_id,searchName], function (error, mRows) {
//          if (error) throw error;
//          element.movies = mRows;
//          musicData.push(element);
//          if (1 == (rows.length - 1)) {
//            res.status(200).json({ success: true, data: musicData });
//          }
//        });


      for (let i = 0; i < rows.length; i++) {
        element = rows[i];
        connect.query(movieSql, [element.time_id,searchName], function (error, mRows) {
          if (error) throw error;
          element.movies = mRows;
		  element.genre_id=element.time_id;
		  element.genre_name=element.time_name;
          musicData.push(element);
          if (i == (rows.length - 1)) {
           		res.status(200).json({ success: true, data: musicData });
          }
        });
      }

    } else {
      res.status(404).json({ success: false, msg: 'times not found' });
    }
  });


//////////////////////////////////
//
//	let sql = "SELECT time_id as genre_id,time_name as genre_name FROM tbl_times order by time_id";
//	let movieSql = "SELECT m.*,t.time_id from tbl_music m LEFT JOIN tbl_music_link_time t ON m.music_id=t.music_id";
//	if (searchName.trim() != '') {
//		movieSql += " where  m.music_title like '%?%'";
//	}
//
//	let timeRows = new Object();
//
//	connect.query(sql,
//	function(error, rows) {
//		if (error) throw error;
//		timeRows = rows;
//		console.info(timeRows);
//		if (timeRows.length < 1) {
//			res.status(404).json({
//				success: false,
//				msg: 'times not found'
//			});
//		}
//	});
//
//	let musicRows = new Object();
//	connect.query(movieSql, [searchName],
//	function(error, mRows) {
//		if (error) throw error;
//		musicRows = mRows;
//		if (musicRows.length < 1) {
//			res.status(404).json({
//				success: false,
//				msg: 'times not found'
//			});
//		}
//	});
//
//console.info(musicRows);
//	let musicData = [1,2,3,4,5];
//	for (var i = 0; i < timeRows.length; i++) {
//
//		let element = timeRows[i];
//		element.movies = [];
//		console.info(element);
//		for (var idx in musicRows) {
//			console.info(musicRows);
//			if (musicRows[idx].time_id == element.time_id) {
//				element.movies.push(musicRows[idx]);
//			}
//		}
//		musicData.push(element);
//
//	}
//	res.status(200).json({
//		success: true,
//		data: musicData
//	});
});



router.get("/cartoonMusic/all", (req, res) => {
  let movieSql = "SELECT m.* from tbl_children_music m LEFT JOIN tbl_music_link_genre l ON m.music_id= l.music_id"
  connect.query(movieSql, function (error, rows) {
    if (error) throw error;
    if (rows.length > 0) {
      res.status(200).json({ success: true, data: rows });
    } else {
      res.status(404).json({ success: false, msg: 'times not found' });
    }
  })
});



router.get("/cartoonMusic/list", (req, res) => {
  let sql = "SELECT time_id as genre_id, time_name as genre_name FROM tbl_times order by time_id";
  let movieSql = "SELECT m.* from tbl_children_music m LEFT JOIN tbl_children_music_time l ON m.music_id= l.music_id where l.time_id=?"
  connect.query(sql, function (error, rows) {
    if (error) throw error;
    if (rows.length > 0) {
      var musicData = []
      for (let i = 0; i < rows.length; i++) {
        let element = rows[i]
        connect.query(movieSql, [element.genre_id], function (error, mRows) {
          if (error) throw error;
          element.movies = mRows
          musicData.push(element)
          if (i == (rows.length - 1)) {
            res.status(200).json({ success: true, data: musicData });
          }
        })
      }
    } else {
      res.status(404).json({ success: false, msg: 'times not found' });
    }
  })
});


router.get("/times/list", (req, res) => {
  const type = req.query.type;
  const searchName = req.query.searchName;
  let sql = "SELECT * FROM tbl_times order by time_id";
  let movieSql = "SELECT m.* FROM tbl_movies m LEFT JOIN tbl_mov_times mt ON m.movies_id=mt.movies_id LEFT JOIN tbl_times t ON mt.time_id = t.time_id where m.type=? and t.time_id = ?"
  console.info(searchName)
  // if(searchName != ''){
  //   movieSql +=` and m.movies_title like ?`;
  // }
  connect.query(sql, function (error, rows) {
    if (error) throw error;
    if (rows.length > 0) {
      var movieData = []
      for (let i = 0; i < rows.length; i++) {
        let element = rows[i]
        var params = [type, element.time_id]
        // if(searchName != ''){
        //   params.push("%"+searchName+"%")
        // }
        console.info(params)
        connect.query(movieSql, params, function (error, mRows) {
          if (error) throw error;
          element.movies = mRows
          movieData.push(element)
          if (i == (rows.length - 1)) {
            res.status(200).json({ success: true, data: movieData });
          }
        })
      }
    } else {
      res.status(404).json({ success: false, msg: 'times not found' });
    }
  })
});

router.get("/cartoon/list", (req, res) => {
  const type = req.query.type;
  let sql = "SELECT time_id as genre_id, time_name as genre_name FROM tbl_times order by time_id";
  let movieSql = "SELECT c.* FROM tbl_cartoon c LEFT JOIN tbl_cartoon_link_time lg ON c.cartoon_id = lg.cartoon_id  where c.type=? and lg.time_id=?"
  connect.query(sql, function (error, rows) {
    if (error) throw error;
    if (rows.length > 0) {
      var cartoonData = []
      for (let i = 0; i < rows.length; i++) {
        let element = rows[i]
        connect.query(movieSql, [type, element.genre_id], function (error, mRows) {
          if (error) throw error;
          element.cartoons = mRows
          cartoonData.push(element)
          if (i == (rows.length - 1)) {
            res.status(200).json({ success: true, data: cartoonData });
          }
        })
      }
    } else {
      res.status(404).json({ success: false, msg: 'times not found' });
    }
  })
});




router.get("/cartoon/all", (req, res) => {

  let sql = "SELECT c.*,g.genre_name FROM tbl_cartoon c LEFT JOIN tbl_cartoon_link_genre lg ON c.cartoon_id = lg.cartoon_id LEFT JOIN tbl_cartoon_genre g ON lg.genre_id = g.cartoon_genre_id"
  connect.query(sql, function (error, rows) {
    if (error) throw error;
    if (rows.length > 0) {
      res.status(200).json({ success: true, data: rows });
    } else {
      res.status(404).json({ success: false, msg: 'times not found' });
    }
  })
});




router.get("/cartoon", (req, res) => {
  const id = req.query.id;
  let sql = "SELECT c.*,g.genre_name,ar.arating_name as arating FROM tbl_cartoon c LEFT JOIN tbl_cartoon_link_genre lg ON c.cartoon_id = lg.cartoon_id LEFT JOIN tbl_cartoon_genre g ON lg.genre_id = g.cartoon_genre_id  LEFT JOIN tbl_arating  ar  on ar.arating_id=c.arating_id  WHERE c.cartoon_id = ?";
  connect.query(sql, [id], function (error, rows) {
    if (error) throw error;
    if (rows.length > 0) {
      res.status(200).json({ success: true, data: rows[0] });
    } else {
      res.status(404).json({ success: false, msg: 'cartoon_id not found' });
    }
  })
});

router.get("/cartoonMusic", (req, res) => {
  const id = req.query.id;
  let sql = "SELECT m.*,g.genre_name from tbl_children_music m LEFT JOIN tbl_music_link_genre l ON m.music_id= l.music_id LEFT JOIN tbl_audio_genre g ON l.genre_id=g.genre_id WHERE m.music_id = ?";
  connect.query(sql, [id], function (error, rows) {
    if (error) throw error;
    if (rows.length > 0) {
      res.status(200).json({ success: true, data: rows[0] });
    } else {
      res.status(404).json({ success: false, msg: 'music_id not found' });
    }
  })
});

router.get("/music", (req, res) => {
  const id = req.query.id;
  let sql = "SELECT m.*,g.genre_name from tbl_music m LEFT JOIN tbl_music_link_genre l ON m.music_id= l.music_id LEFT JOIN tbl_audio_genre g ON l.genre_id=g.genre_id WHERE m.music_id = ?";
  connect.query(sql, [id], function (error, rows) {
    if (error) throw error;
    if (rows.length > 0) {
      res.status(200).json({ success: true, data: rows[0] });
    } else {
      res.status(404).json({ success: false, msg: 'music_id not found' });
    }
  })
});

router.get("/movies", (req, res) => {
  const id = req.query.id;
  let sql = "SELECT m.*,g.genre_name,ar.arating_name as arating from tbl_movies m LEFT JOIN tbl_mov_genre mg on m.movies_id = mg.movies_id LEFT JOIN tbl_genre g ON mg.genre_id = g.genre_id  LEFT JOIN tbl_arating  ar  on ar.arating_id=m.arating_id  WHERE m.movies_id = ?";
  connect.query(sql, [id], function (error, rows) {
    if (error) throw error;
    if (rows.length > 0) {
      res.status(200).json({ success: true, data: rows[0] });
    } else {
      res.status(404).json({ success: false, msg: 'movies not found' });
    }
  })
});




router.get("/comment", (req, res) => {
  const id = req.query.id;
  let sql = "SELECT m.*,u.avatar,u.user_name FROM tbl_comments m LEFT JOIN tbl_user u ON m.user_id = u.user_id WHERE m.movies_id = ?";
  connect.query(sql, [id], function (error, rows) {
    if (error) throw error;
    let commentData = [];
    if (rows.length > 0) {
      for (let i = 0; i < rows.length; i++) {
        let item = rows[i];
        item.avatar = '/images/svg/' + item.avatar + ".svg"
        commentData.push(item)
      }
    } 
    res.status(200).json({ success: true, data: commentData });
  })
});



router.use((req, res) => {
  res.status(404);
  res.render("error", { layout: "errorLayout.hbs", errormessage: `you've lost your way a wee bit! "${req.url}" doesn't exisit!` });
})

module.exports = router;