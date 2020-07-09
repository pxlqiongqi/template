package com.daidai.stdlsbackend.utils;

/**
 * @author : jmking
 * create at:  2019-06-20  13:33
 * @description: 代码生成器
 */
public class GenCodeTest {
    public static void main(String[] args) throws InterruptedException {
        String dbUrl = "jdbc:mysql://localhost:3306/stdls";
        String dbUserName = "stdls";
        String dbPwd = "123456";
        // 包名
        String daoPackageName = "com.daidai.stdlsbackend.dao";
        String servicePackageName = "com.daidai.stdlsbackend.service";
        String webPackageName = "com.daidai.stdlsbackend.web";
        String daoTargetModuleName = "stdls-backend-dao";
        String serviceTargetModuleName = "stdls-backend-service";
        String webTargetModuleName = "stdls-backend-web";

        // 业务模块名
        String moduleName = "user";
        // 生成代码的module
        String[] tables = new String[]{"user"};

        ServiceGenerator cg = new ServiceGenerator(dbUrl, dbUserName, dbPwd);
        // 包名
        cg.setPackageName(servicePackageName);
        cg.setModuleName(moduleName);
        cg.setModuleDirName(serviceTargetModuleName);
        cg.genCode(tables);


        DaoGenerator cg1 = new DaoGenerator(dbUrl, dbUserName, dbPwd);
        // 包名
        cg1.setPackageName(daoPackageName);
        cg1.setModuleName(moduleName);
        cg1.setModuleDirName(daoTargetModuleName);
        cg1.genCode(tables);

       WebGenerator cg2 = new WebGenerator(dbUrl, dbUserName, dbPwd);
        // 包名
        cg2.setPackageName(webPackageName);
        cg2.setModuleName(moduleName);
        cg2.setModuleDirName(webTargetModuleName);
        cg2.genCode(tables);
    }
}

