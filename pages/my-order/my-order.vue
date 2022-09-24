<template>
	<view class='my-order bg-active-color'>
		<Lines></Lines>
		<view class='order-header'>
			<view 
				class='header-item'
				v-for='(item,index) in tabList'
				:key='index'
				:class=' tabIndex==index?"active":""  '
				@click='changeTab(index)'
			>{{item.name}}</view>
		</view>
		
		<block
			v-for='(tabItem,tabI) in tabList'
			:key='tabI'
		>
			<view v-show='tabI===tabIndex'>
				<view v-if='tabItem.list.length > 0' class='order-main' :style="'height:'+clentHeight+'px;'">
					<!--商品-->
					<view v-for='(k,i) in tabItem.list' :key='i'>
						<view class='order-goods'>
							<view class='goods-status f-active-color'>{{ k.status }}</view>
							<view class='goods-item'v-for='(item,index) in k.goods_item'>
								<OrderList :item='item' :index='index'></OrderList>
							</view>
						</view>
						<Lines></Lines>
						<!--总价-->
						<view class='total-price'>
							订单金额: <text class='f-active-color'>¥{{k.totalPrice}}</text> (包含运费¥0.00)
						</view>
						<Lines></Lines>
						<!--支付-->
						<view class='payment'>
							<view class='payment-text f-active-color' @click="goSuccess">支付</view>
						</view>
					</view>
				</view>
				<view v-else class='no-order' :style="'height:'+clentHeight+'px;'">
					<view>您还没有相关订单哦~~</view>
					<view class='no-order-home' @click="goIndex">去首页逛逛</view>
				</view>
			</view>
		</block>
	</view>
</template>

<script>
	import Lines from '@/components/common/Lines.vue'
	import OrderList from '@/components/order/order-list.vue'
	export default {
		data() {
			return {
				//高度
				clentHeight:0,
				//当前位置
				tabIndex:0,
				//顶部选项卡的数据
				tabList:[
					{
						name:"全部",
						list:[]
					},
					{
						name:"待付款",
						list:[]
					},
					{
						name:"待发货",
						list:[]
					},
					{
						name:"待收货",
						list:[]
					},
					{
						name:"待评价",
						list:[]
					},
				]
			}
		},
		onReady() {
			uni.getSystemInfo({
				success: (res) => {
					this.clentHeight = res.windowHeight - this.getClientHeight();
				}
			})
		},
		components:{
			Lines,
			OrderList
		},
		methods: {
			//顶部切换
			changeTab(index){
				this.tabIndex = index;
			},
			//获取可视区域高度【兼容】
			getClientHeight(){
				const res = uni.getSystemInfoSync();
				const system = res.platform;
				if( system ==='ios' ){
					return 44+res.statusBarHeight;
				}else if( system==='android' ){
					return 48+res.statusBarHeight;
				}else{
					return 0;
				}
			},
			goIndex(){
				uni.reLaunch({
					url:"/pages/index/index"
				})
			},
			goSuccess(){
				uni.reLaunch({
					url:"/pages/payment-success/payment-success"
				})
			},
		}
	}
</script>

<style scoped>
	.no-order {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		background-color: #fff;
		margin-top: -126rpx;
	}
	.no-order-home {
		padding: 6rpx 60rpx;
		border: 2rpx solid #49bdfb;
		color: #49bdfb;
		border-radius: 40rpx;
		margin: 10rpx 0 0 0;
	}
	.order-header {
		background-color: #fff;
		display: flex;
		justify-content: center;
		align-items: center;
		border-bottom: 2rpx solid #f7f7ff;
	}
	.header-item {
		line-height: 120rpx;
		text-align: center;
		flex: 1;
	}
	.active {
		border-bottom: 4rpx solid #49bdfb;
	}
	.goods-status {
		display: flex;
		justify-content: flex-end;
		background-color: #fff;
		padding: 20rpx;
	}
	.total-price {
		padding: 20rpx;
		display: flex;
		justify-content: flex-end;
		background-color: #fff;
	}
	.payment {
		display: flex;
		justify-content: flex-end;
		padding: 16rpx;
		background-color: #fff;
	}
	.payment-text {
		border: 2rpx solid #49bdfb;
		padding: 4rpx 40rpx;
		border-radius: 30rpx;
	}
</style>
