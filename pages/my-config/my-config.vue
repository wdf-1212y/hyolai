<template>
	<view class='my-config'>
		<view class='config-item' @click='goPathList'>
			<view>地址管理</view>
			<view class='config-mark'> > </view>
		</view>
		<view class='config-item'>
			<view>账号管理</view>
			<view class='config-mark'> > </view>
		</view>
		<view class='config-item'>
			<view>字体设置</view>
			<view class='config-mark'> > </view>
		</view>
		<view class='my-exit' @click='outLogin'>退出登录</view>
	</view>
</template>

<script>
	import {mapMutations} from 'vuex'
	export default {
		data() {
			return {
				
			}
		},
		methods: {
			...mapMutations(['loginOut']),
			goPathList(){
				uni.navigateTo({
					url:'../my-path-list/my-path-list'
				})
			},
			outLogin(){
				uni.showToast({
					title:"退出成功",
					icon:"none"
				})
				this.loginOut();
				uni.reLaunch({
					url:"../index/index"
				})
			}
		}
	}
</script>

<style scoped>
	.config-item{
		display: flex;
		justify-content: space-between;
		padding: 20rpx 0 20rpx 20rpx;
		border-bottom: 2rpx solid #ccc;
	}
	.config-mark{
		padding-right: 10rpx;
	}
	.my-exit{
		background-color: #49bdfb;
		width: 100%;
		line-height: 80rpx;
		color: #fff;
		text-align: center;
	}
</style>
