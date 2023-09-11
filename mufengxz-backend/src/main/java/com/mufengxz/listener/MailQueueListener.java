package com.mufengxz.listener;

import jakarta.annotation.Resource;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
@RabbitListener(queues = "mail")
public class MailQueueListener {

    @Value("${spring.mail.username}")
    String username;
    @Resource
    JavaMailSender sender;

    //根据不同类型发送邮箱验证码
    @RabbitHandler
    public void sendMailMessage(Map<String, Object> data) {
        String email = (String)data.get("email");
        String code = String.valueOf(data.get("code"));
        String type = (String) data.get("type");
        SimpleMailMessage simpleMailMessage = switch (type) {
            case "register" -> createMessage("欢迎注册我们的网站","您的邮箱注册验证码为：" + code + "，有效时间5分钟，为了保障您的安全，请勿向他人泄露验证码信息！", email);
            case "reset" -> createMessage("你的密码重置邮件","您好，您正在进行重置密码操作，验证码：" + code + "，有效时间5分钟，如非本人操作，请无视！", email);
            default -> null;
        };
        if(simpleMailMessage == null) return;
        sender.send(simpleMailMessage);
    }

    //构造邮箱
    private SimpleMailMessage createMessage(String title, String content, String email) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setSubject(title);
        mailMessage.setText(content);
        mailMessage.setTo(email);
        mailMessage.setFrom(username);
        mailMessage.setSubject(title);
        return mailMessage;
    }
}
