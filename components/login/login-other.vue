<template>
	<view class="login-other">
		<view class="other-text">
			<view>或用以下方式登录</view>
		</view>
		<view class="other">
			<view class="other-item">
				<image class="other-img" src="../../static/img/wx.png" mode=""></image>
				<view>微信登录</view>
			</view>
			<view class="other-item">
				<image class="other-img" src="../../static/img/wb.png" mode=""></image>
				<view>微博登录</view>
			</view>
			<view class="other-item">
				<image class="other-img" src="../../static/img/qq.png" mode=""></image>
				<view>QQ登录</view>
			</view>
		</view>
	</view>
</template>

<script>
</script>

<style scoped>
	/* 其它登陆方式 */
	.login-other{
		padding: 100rpx 0;
	}
	.other-text{
		display: flex;
		padding: 50rpx 0;
	}
	.other-text view{
		line-height: 0;
		padding: 0 20rpx;
	}
	.other-text::after{
		flex: 1;
		content: "";
		height: 2rpx;
		background-color: #ccc;
	}
	.other-text::before{
		flex: 1;
		content: "";
		height: 2rpx;
		background-color: #ccc;
	}
	.other{
		display: flex;
		justify-content: space-around;
	}
	.other-item{
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	.other-img{
		width: 80rpx;
		height: 80rpx;
	}
	/* 其它登陆方式 */
</style>