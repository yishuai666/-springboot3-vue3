<script setup>
import { reactive, ref} from "vue";
import { User, Lock } from '@element-plus/icons-vue'
import {ElMessage} from "element-plus";
import request from "@/utils/request";
import {useUserStore} from "@/stores/user";
import router from "@/router";


const loginParam = reactive({})
const loginRules = reactive({
  username: [
    { required: true, message: '请输入账号', trigger: 'blur' },
    { min: 3, max: 10, message: '账号长度在3-10位之间', trigger: 'blur' },
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
    { min: 3, max: 20, message: '密码长度在3-20位之间', trigger: 'blur' },
  ],
})
const loginRef = ref()
const loginFn = () => {
  loginRef.value.validate(valid => {
    if (valid) {
      // request.interceptors.request.use(config => {config.headers['Content-Type'] = 'application/x-www-form-urlencoded';})
      request.post('/api/auth/login', loginParam).then(res => {
        if (res.code === 200) {
          ElMessage.success('登录成功')
          const userStore = useUserStore()
          userStore.setManagerInfo(res.data)
          router.push('/')
        } else {
          ElMessage.error(res.message)
        }
      })
    }
  })
}
</script>


<template>
  <div class="login-wrap">
    <div class="ms-login">
      <div class="ms-title">沐风小站后台管理系统</div>
      <el-form :model="loginParam" :rules="loginRules" ref="loginRef" label-width="0px" class="ms-content">
        <el-form-item prop="username">
          <el-input v-model="loginParam.username" placeholder="username">
            <template #prepend>
              <el-button :icon="User" disabled></el-button>
            </template>
          </el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input
              type="password"
              placeholder="password"
              v-model="loginParam.password"
              @keyup.enter="loginFn"
          >
            <template #prepend>
              <el-button :icon="Lock" disabled></el-button>
            </template>
          </el-input>
        </el-form-item>
        <div class="login-btn">
          <el-button type="primary" @click="loginFn">登录</el-button>
        </div>
        <p class="login-tips">Tips : admin/123</p>
      </el-form>
    </div>
  </div>
</template>


<style scoped>
.login-wrap {
  position: absolute;
  padding-left: 0;
  padding-bottom: 0;
  width: 100%;
  height: 100%;
  background-image: url(../assets/img/login-bg.jpg);
  background-size: 100%;
}

.ms-title {
  width: 100%;
  line-height: 50px;
  text-align: center;
  font-size: 20px;
  color: #fff;
  border-bottom: 1px solid #ddd;
}

.ms-login {
  position: absolute;
  left: 50%;
  top: 50%;
  width: 350px;
  margin: -190px 0 0 -175px;
  border-radius: 5px;
  background: rgba(255, 255, 255, 0.3);
  overflow: hidden;
}

.ms-content {
  padding: 30px 30px;
}

.login-btn {
  text-align: center;
}

.login-btn button {
  width: 100%;
  height: 36px;
  margin-bottom: 10px;
}

.login-tips {
  font-size: 12px;
  line-height: 30px;
  color: #fff;
}
</style>