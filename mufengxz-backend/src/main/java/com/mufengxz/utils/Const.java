package com.mufengxz.utils;

public class Const {
    //令牌黑名单
    public static final String JWT_BLACK_LIST = "jwt:blacklist:";
    //邮箱验证码数据
    public static final String VERIFY_EMAIL_DATA = "verify:email:data";
    //邮箱验证码限流
    public static final String VERIFY_EMAIL_LIMIT = "verify:email:limit";

    //限流优先级
    public static final int ORDER_FLOW_LIMIT = -101;
    //跨域优先级
    public static final int ORDER_CORS = -102;

    //封禁限流ip
    public static final String FLOW_LIMIT_BLOCK = "flow:limit:block";
    //封禁限流次数
    public static final String FLOW_LIMIT_COUNTER = "flow:limit:counter";
    //用户角色
    public final static String ROLE_DEFAULT = "USER";
}
