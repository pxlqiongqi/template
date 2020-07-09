package com.daidai.stdlsbackend.utils;

/**
 * @author : jmking
 * create at:  2019-06-20  13:33
 * @description: 代码生成器
 */
public class GenDaoTest {
    public static void main(String[] args) throws InterruptedException {
        String dbUrl = "jdbc:mysql://localhost:3306/stdls";
        String dbUserName = "stdls";
        String dbPwd = "123456";
        // 包名
        String packageName = "com.daidai.stdlsbackend.dao";
        //String packageName = "com.daidai.qingshancloud.wechat.api";
        // 业务模块名
        String moduleName = "user";
        // 生成代码的module
        //String targetModuleName = "wechat-api";
        String targetModuleName = "stdls-backend-dao";
        DaoGenerator cg = new DaoGenerator(dbUrl, dbUserName, dbPwd);
        // 包名
        cg.setPackageName(packageName);
        cg.setModuleName(moduleName);
        cg.setModuleDirName(targetModuleName);
        cg.genCode("user");
    }
}

