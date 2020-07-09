package com.daidai.stdlsbackend.service.user.service.impl;

import com.daidai.stdlsbackend.dao.user.entity.UserDO;
import com.daidai.stdlsbackend.dao.user.mapper.UserMapper;
import com.daidai.stdlsbackend.service.user.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户 服务实现类
 * </p>
 *
 * @author system
 * @since 2020-07-09
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, UserDO> implements IUserService {

}
