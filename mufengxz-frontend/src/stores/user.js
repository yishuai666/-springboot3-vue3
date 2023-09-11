import { defineStore } from 'pinia'
import router, {setRoutes} from "@/router";
import request from '@/utils/request'
import {ElMessage} from "element-plus";

const managerName = `manager`

const useUserStore = defineStore(managerName, {
    state: () => ({
        managerInfo: {}
    }),
    getters: {
        getUserId() {
            return this.managerInfo.username ? this.managerInfo.user.id : 0
        },
        getUser() {
            return this.managerInfo.user || {}
        },
        getBearerToken() {
            return this.managerInfo.token ? 'Bearer ' + this.managerInfo.token : ''
        },
        getToken() {
            return this.managerInfo.token || ""
        },
        getMenus() {
            return this.managerInfo.menus || []
        },
        getAuths() {
            return this.managerInfo.auths.length ? this.managerInfo.auths.map(v => v.auth) : []
        },
        getExpire() {
            return this.managerInfo.expire || ""
        }
    },
    actions: {
        setManagerInfo(managerInfo) {
            this.managerInfo = managerInfo
            // 设置路由
            setRoutes(managerInfo.menus)
        },
        setUser(user) {
            this.managerInfo.user = JSON.parse(JSON.stringify(user))
        },
        setExpire(expire) {
            this.managerInfo.expire = expire
        },
        logout() {
            sessionStorage.removeItem(managerName)
            localStorage.removeItem(managerName)
            router.push('/login')
        },
        isExpire(expire){
            if(new Date(expire) <= new Date()) {
                sessionStorage.removeItem(managerName)
                localStorage.removeItem(managerName)
                ElMessage.warning("登录状态已过期，请重新登录！")
                return false
            }
            return true
        }
    },
    mutations: {

    },
    // 开启数据持久化
    persist: true
})
export { useUserStore, managerName }
