package com.msq.service;

import com.msq.entity.Admin;
import com.msq.entity.Role;
import com.msq.entity.RoleAdmin;
import com.msq.repository.AdminRepository;
import com.msq.repository.RoleAdminRepository;
import com.msq.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Service
public class AuthService  implements UserDetailsService {

    @Autowired
    private AdminRepository adminRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private RoleAdminRepository roleAdminRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Collection<GrantedAuthority> authorities = new ArrayList<>();
        // 从数据库中取出用户信息
        Admin admin = this.adminRepository.findAdminByAdminName(username);

        // 判断用户是否存在
        if (admin == null) {
            throw new UsernameNotFoundException("管理员不存在");
        }

        // 添加权限
       /* List<SysUserRole> userRoles = userRoleService.listByUserId(user.getId());
        for (SysUserRole userRole : userRoles) {
            SysRole role = roleService.selectById(userRole.getRoleId());
            authorities.add(new SimpleGrantedAuthority(role.getName()));
        }*/
        //通过adminid来得出roleid，再个悲剧roleid查询该用户权限集合
        List<RoleAdmin> roleAdmins = this.roleAdminRepository.findRoleAdminByAdminId(admin.getAdminId());

        for (RoleAdmin ra: roleAdmins) {
            Role role = this.roleRepository.findByRoleId(ra.getRoleId());
            authorities.add(new SimpleGrantedAuthority(role.getRoleName()));
        }



        // 返回UserDetails实现类
        return new User(admin.getAdminName(), admin.getPassword(), authorities);
    }
}
