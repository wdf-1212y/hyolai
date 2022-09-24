var User = {
	//查询用户名
	queryUserName( param ){
		if( param.userName ){
			//phone = 应该是手机号这个变量[属性],为了好操作所有名称改为:userName
			return "select * from user where userName = '"+param.userName+"' or phone = '"+param.userName+"' ";
		}
	},
	//验证用户名和密码
	queryUserPwd( param ){
		return "select * from user where userName = '"+param.userName+"' or phone = '"+param.userName+"' and userPwd = '"+param.userPwd+"' ";
	},
	//增加一条用户数据
	insertData( param ){
		let userName = param.userName;
		const jwt = require('jsonwebtoken');
		let payload = {name:userName}; //用户名
		let secret = 'aolai';//口令
		let token = jwt.sign(payload,secret);
		let nickName = param.nickName || "默认昵称";
		let avatarUrl = param.avatarUrl || "../../static/img/logo.jpg";
		return 'insert into user (userName,userPwd,phone,imgUrl,nickName,token) values ("","111111","'+userName+'","'+avatarUrl+'","'+nickName+'","'+token+'")';
	}
}

exports = module.exports = User;