console.log("comment Module...");

var commentService = (function(){
	
    //댓글 하나 조회
	function get(commentNo, callback, error){
		
		$.get("/comments/" + commentNo + ".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	//댓글 등록
	function add(comment, callback, error){
		console.log("add comment...........");
		
		$.ajax({
			type : 'post',
			url : '/comments/new',
			data : JSON.stringify(comment),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	
	//댓글 수정
	function update(comment, callback, error){
		
		console.log("commentNo: " + comment.commentNo);
		
		$.ajax({
			type : 'put',
			url : '/comments/' + comment.commentNo,
			data : JSON.stringify(comment),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	//댓글 삭제
	function remove(commentNo, callback, error){
		$.ajax({
			type: 'delete',
			url: '/comments/' + commentNo,
			success: function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	
	//댓글목록
	function getList(param, callback, error){
		
		var classQnaNo = param.classQnaNo;	

		var page = param.page || 1;
		
		$.getJSON("/comments/pages/" + classQnaNo + "/" + page + ".json",
				function(data){
					if(callback){
						callback(data);
					}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	//날짜변환
	function displayTime(timeValue){
		var today = new Date();
		
		var gap = today.getTime() - timeValue;
		
		var dataObj = new Date(timeValue);
		var str = "";
		
		if(gap < (1000 * 60 * 60 * 24)){
			
			var hh = dataObj.getHours();
			var mi = dataObj.getMinutes();
			var ss = dataObj.getSeconds();
			
			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
				':', (ss > 9 ? '' : '0') + ss].join('');
		}else {
			
			var yy = dataObj.getFullYear();
			var mm = dataObj.getMonth() + 1; 
			var dd = dataObj.getDate();
			
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
				(dd > 9 ? '' : '0') + dd ].join('');
		}
	}
	;
	return{
		add : add,
		getList : getList,
		get	: get,
		update : update,
		displayTime : displayTime,
		remove : remove
	};
})();
