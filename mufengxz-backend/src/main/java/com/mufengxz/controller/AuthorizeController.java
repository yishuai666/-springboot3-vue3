package com.mufengxz.controller;

import com.mufengxz.entity.RestBean;
import com.mufengxz.entity.vo.request.EmailRegisterVo;
import com.mufengxz.entity.vo.response.ConfirmResetVo;
import com.mufengxz.entity.vo.response.EmailResetVo;
import com.mufengxz.service.UserService;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Pattern;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.function.Function;
import java.util.function.Supplier;

@Validated
@RestController
@RequestMapping("/api/auth")
public class AuthorizeController {

    @Resource
    UserService userService;

    @GetMapping("/ask-code")
    public RestBean<Void> askVerifyCode(@RequestParam @Email String email,
                                        @RequestParam @Pattern(regexp = "(register|reset)") String type,
                                        HttpServletRequest request) {
//        String message = accountService.registerEmailVerifyCode(type, email, request.getRemoteAddr());
//        return message == null ? RestBean.success() : RestBean.failure(400, message);
        return this.messageHandle(() -> userService.registerEmailVerifyCode(type, email, request.getRemoteAddr()));
    }

    @PostMapping("/register")
    public RestBean<Void> register(@RequestBody @Valid EmailRegisterVo vo) {
//        String message = accountService.registerEmailAccount(vo);
//        return message == null ? RestBean.success() : RestBean.failure(400, message);
        return this.messageHandle(() -> userService.registerEmailUser(vo));
    }

    @PostMapping("/reset-confirm")
    public RestBean<Void> resetConfirm(@RequestBody @Valid ConfirmResetVo vo) {
//        return this.messageHandle(() -> accountService.resetConfirm(vo));
        return this.messageHandle(vo, userService::resetConfirm);
    }

    @PostMapping("/reset-password")
    public RestBean<Void> resetPassword(@RequestBody @Valid EmailResetVo vo) {
        return this.messageHandle(vo, userService::resetEmailUserPassword);
    }

    private <T> RestBean<Void> messageHandle(T vo, Function<T, String> function) {
        return this.messageHandle(() -> function.apply(vo));
    }

    private RestBean<Void> messageHandle(Supplier<String> action) {
        String message = action.get();
        return message == null ? RestBean.success() : RestBean.failure(400, message);
    }
}
