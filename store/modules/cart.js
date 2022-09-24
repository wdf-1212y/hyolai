import $http from '@/common/api/request.js';
export default {
	state: {
		list: [],
		selectedList: []
	},
	getters: {
		//判断是否  全选
		checkedAll(state) {
			return state.list.length === state.selectedList.length;
		},
		//合计+结算数量
		totalCount(state) {
			let total = {
				pprice: 0,
				num: 0
			}
			state.list.forEach(v => {
				//是否选中
				if (state.selectedList.indexOf(v.id) > -1) {
					//合计
					total.pprice += v.pprice * v.num;
					//结算数量
					total.num = state.selectedList.length;
				}
			})
			return total;
		}
	},
	mutations: {
		//请求到数据赋值操作
		initGetData(state, list) {
			state.list = list;
		},
		//全选
		checkAll(state) {
			state.selectedList = state.list.map(v => {
				v.checked = true;
				return v.id;
			})
		},
		//全不选
		unCheckAll(state) {
			state.list.forEach(v => {
				v.checked = false;
			})
			state.selectedList = [];
		},
		//单选
		selectedItem(state, index) {
			let id = state.list[index].id;
			let i = state.selectedList.indexOf(id);
			//如果selectedList已经存在就代表他之前是选中状态, checked=false,并且在selectedList删除
			if (i > -1) {
				state.list[index].checked = false;
				return state.selectedList.splice(i, 1);
			}
			//如果之前没有选中,checked=true , 把当前的id添加到selectedList
			state.list[index].checked = true;
			state.selectedList.push(id);
		},
		delGoods(state) {
			state.list = state.list.filter(v => {
				return state.selectedList.indexOf(v.id) === -1;
			})
		},
		//加入购物车
		addShopCart(state, goods) {
			state.list.push(goods);
		}
	},
	actions: {
		checkedAllFn({
			commit,
			getters
		}) {
			getters.checkedAll ? commit("unCheckAll") : commit("checkAll");
		},
		delGoodsFn({
			commit,
			state
		}) {
			uni.showModal({
				title:"重要提示",
				content:'确定删除吗?',
				cancelText:'取消',
				confirmText:"确定",
				success: (ress) => {
					if(ress.confirm){
						$http.request({
							url: "/deleteCart",
							method: "POST",
							header: {
								token: true
							},
							data: {
								goodsId: state.selectedList
							}
						}).then((res) => {
							commit('delGoods');
							commit('unCheckAll');
							uni.showToast({
								title: '删除成功',
								icon: "none"
							})
						}).catch(() => {
							uni.showToast({
								title: '请求失败',
								icon: 'none'
							})
						})
					}
				},
			})
		}
	}
}
