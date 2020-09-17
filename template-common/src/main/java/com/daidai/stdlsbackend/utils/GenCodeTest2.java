package com.daidai.stdlsbackend.utils;

/**
 * @author : jmking
 * create at:  2019-06-20  13:33
 * @description: 代码生成器
 */
public class GenCodeTest2 {
    public static void main(String[] args) throws InterruptedException {
        String dbUrl = "jdbc:mysql://localhost:3306/stdls";
        String dbUserName = "root";
        String dbPwd = "root";
        // 包名
        String daoPackageName = "com.daidai.stdlsbackend.dao";
        String servicePackageName = "com.daidai.stdlsbackend.service";
        String webPackageName = "com.daidai.stdlsbackend.web";
        String daoTargetModuleName = "stdls-backend-dao";
        String serviceTargetModuleName = "stdls-backend-service";
        String webTargetModuleName = "stdls-backend-web";

        // 业务模块名
        String moduleName = "basic";
        // 生成代码的module
        String[] tables = new String[]{"community_info"};

        CodeGenerator service = new CodeGenerator(dbUrl, dbUserName, dbPwd);
        // 包名
        service.setOnlyService(true);
        service.setPackageName(servicePackageName);
        service.setModuleName(moduleName);
        service.setModuleDirName(serviceTargetModuleName);
        service.genCode(tables);


        CodeGenerator dao = new CodeGenerator(dbUrl, dbUserName, dbPwd);
        // 包名
        dao.setOnlyDao(true);
        dao.setPackageName(daoPackageName);
        dao.setModuleName(moduleName);
        dao.setModuleDirName(daoTargetModuleName);
        dao.genCode(tables);

        CodeGenerator web = new CodeGenerator(dbUrl, dbUserName, dbPwd);
        // 包名
        web.setOnlyWeb(true);
        web.setPackageName(webPackageName);
        web.setModuleName(moduleName);
        web.setModuleDirName(webTargetModuleName);
        web.genCode(tables);
    }
}

