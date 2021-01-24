/*
package com.msq.config;

import com.msq.service.AdminService;
import com.msq.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    private AdminService adminService;


    //用于密码加密
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;


 */
/*   @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        // 创建内存用户
        auth.inMemoryAuthentication()
                .withUser("user").password(passwordEncoder.encode("123456")).roles("USER")
                .and()
                .withUser("admin").password(passwordEncoder.encode("admin")).roles("USER", "ADMIN");
    }
*//*

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //关闭security的认证功能
        http.authorizeRequests().anyRequest().permitAll().and().logout().permitAll();


        //开启认证功能
           */
/* http
                .authorizeRequests()
                .antMatchers("/gologin", "/login.jsp","/static/**").permitAll() // 这三个目录不做安全控制
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/gologin")
                .loginProcessingUrl("login")
                .failureUrl("/login?error")
                .defaultSuccessUrl("/login")
                    .permitAll(); // 登录不需要安全控制*//*

    }

//    @Bean
//    @Override
//    public UserDetailsService userDetailsService() {
//        //固定的账号密码是不安全的，spring不建议生产环境这样使用
//        //UserDetails user =
//        //     User.withDefaultPasswordEncoder()
//        //       .username("user")
//        //        .password("password")
//        //        .roles("USER")
//        //        .build();
//        //return new InMemoryUserDetailsManager(user);
//        return new AuthService();
//    }




    // spring security 必须有一个passwordEncoder
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
*/
