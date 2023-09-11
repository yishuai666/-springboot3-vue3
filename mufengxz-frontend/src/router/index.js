import { createRouter, createWebHistory } from 'vue-router'
import {useUserStore} from "@/stores/user"
const modules = import.meta.glob('../views/*.vue')
const layoutModules = import.meta.glob('../layout/Layout.vue')

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'Layout',
      component: () => import('../layout/Layout.vue'),
      children: [
        { path: 'home', name: 'Home', component: () => import('../views/Home.vue') },
        { path: 'person', name: 'Person', component: () => import('../views/Person.vue') },
        { path: 'password', name: 'Password', component: () => import('../views/Password.vue') },
      ]
    },
    {
      path: '/login',
      name: 'Login',
      component: () => import('../views/Login.vue')
    },
    {
      path: '/404',
      name: '404',
      component: () => import('../views/404.vue')
    }
  ]
})

// 注意：刷新页面会导致页面路由重置
export const setRoutes = (menus) => {
  if (!menus || !menus.length) {
    const manager = localStorage.getItem('manager')
    if (!manager) {
      return
    }
    menus = JSON.parse(manager).managerInfo.menus
  }

  if (menus.length) {
    // 开始渲染 未来的不确定的  用户添加的路由
    menus.forEach(item => {   // 所有的页面都需要设置路由，而目录不需要设置路由
      if (item.path) {  // 当且仅当path不为空的时候才去设置路由
        router.addRoute('Layout', { path: item.path, name: item.page, component: modules['../views/' + item.page + '.vue'] })
      } else {
        if (item.children && item.children.length) {
          item.children.forEach(sub => {
            if (sub.path) {
              router.addRoute('Layout', { path: sub.path, name: sub.page, component: modules['../views/' + sub.page + '.vue'] })
            }
          })
        }
      }
    })
  }
}

setRoutes()


// 路由守卫
router.beforeEach((to, from, next) => {
  const store = useUserStore()  // 拿到用户对象信息
  const user = store.managerInfo.user
  const expire = store.managerInfo.expire
  const hasUser = user && user.id && store.isExpire(expire)
  const noPermissionPaths = ['/login', '/404']   // 定义无需登录的路由
  // if (!hasUser) {
  if (!hasUser && !noPermissionPaths.includes(to.path)) {  // 用户没登录,  假如你当前跳转login页面，然后login页面没有用户信息，这个时候你再去往 login页面跳转，就会发生无限循环跳转
    // 获取缓存的用户数据
    //  如果to.path === '/login' 的时候   !noPermissionPaths.includes(to.path) 是返回 false的，也就不会进 next("/login")
    next("/login")
  } else {
    if (!to.matched.length) {
      next('/404')
    } else {
      next()
    }
  }
})

export default router
