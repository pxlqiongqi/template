package com.daidai.stdlsbackend.dao.user.entity;

    import com.baomidou.mybatisplus.annotation.TableName;
    import com.baomidou.mybatisplus.annotation.IdType;
    import com.baomidou.mybatisplus.extension.activerecord.Model;
    import java.time.LocalDateTime;
    import com.baomidou.mybatisplus.annotation.TableId;
    import java.io.Serializable;
    import lombok.Data;
    import lombok.EqualsAndHashCode;
    import lombok.experimental.Accessors;

/**
* <p>
    * 用户
    * </p>
*
* @author system
* @since 2020-07-09
*/
    @Data
        @EqualsAndHashCode(callSuper = false)
    @Accessors(chain = true)
    @TableName("user")
    public class UserDO extends Model<UserDO> {

    private static final long serialVersionUID = 1L;

            /**
            * id
            */
            @TableId(value = "user_id", type = IdType.ID_WORKER_STR)
    private String userId;

            /**
            * 姓名
            */
    private String name;

            /**
            * 手机号
            */
    private String phone;

            /**
            * 所属区域
            */
    private String areaId;

            /**
            * 所属区域级别
            */
    private Boolean lv;

            /**
            * 登录账号
            */
    private String account;

            /**
            * 登录密码
            */
    private String password;

            /**
            * 账号类型 1-城管局|2-运营商
            */
    private Boolean userType;

            /**
            * 运营商id
            */
    private String companyId;

            /**
            * 是否删除(0:正常,1:删除)
            */
    private Boolean deleted;

            /**
            * 创建时间
            */
    private LocalDateTime addTime;

            /**
            * 更新时间
            */
    private LocalDateTime updateTime;


    @Override
    protected Serializable pkVal() {
        return this.userId;
    }

}
