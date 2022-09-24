<template>
	<view class='payment-success'>
		<view class='f-active-color' style='font-size:52rpx;'>恭喜您支付成功</view>
		<view @click='goIndex' class="return-index f-active-color">返回首页</view>
	</view>
</template>

<script>
    import $http from '@/common/api/request.js'
	export default {
		data() {
			return {
				
			}
		},
		methods: {
			goIndex(){
				uni.reLaunch({
					url:"../index/index"
				})
			}
		}
	}
</script>

<style scoped>
	.payment-success{
		position: absolute;
		left: 0;
		right: 0;
		bottom: 0;
		top: 0;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	.return-index{
		padding: 10rpx 40rpx;
		border: 2rpx solid #49bdfb;
		border-radius: 40rpx;
	}
</style>
