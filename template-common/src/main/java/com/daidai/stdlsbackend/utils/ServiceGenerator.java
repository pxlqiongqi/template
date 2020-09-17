package com.daidai.stdlsbackend.utils;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import lombok.Data;
import org.springframework.util.StringUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * @author : jmking
 * create at:  2019-06-20  09:11
 * @description: mybatis代码生成器
 */
@Data
public class ServiceGenerator {
    private String dbUrl;
    private String dbDriverName = "com.mysql.jdbc.Driver";
    private String dbUserName;
    private String dbPwd;
    private String projectPath;
    private String serviceName = "I%sService";
    private String serviceImplName = "%sServiceImpl";
    private String entityName = "%sDO";
    private String moduleName;
    private String packageName;
    private String servicePkgName = "service";
    private String serviceImplPkgName = "service.impl";
    private String superEntityClass = "";
    private String superServiceClass = "";
    private String moduleDirName = "";
    private boolean onlyEntity = true;

    public ServiceGenerator(String dbUrl, String dbUserName, String dbPwd) {
        this.dbUrl = dbUrl;
        this.dbUserName = dbUserName;
        this.dbPwd = dbPwd;
    }

    private GlobalConfig getGlobalConfig() {
        if (StringUtils.isEmpty(this.projectPath)) {
            this.projectPath = System.getProperty("user.dir") + "/" + this.moduleDirName;
        }
        GlobalConfig config = new GlobalConfig();
        config.setActiveRecord(true)
                .setAuthor("system")
                .setOutputDir(this.projectPath + "/src/main/java")
                .setFileOverride(true)
                .setIdType(IdType.ID_WORKER_STR)
                .setEnableCache(false)
                .setBaseResultMap(true);
        config.setServiceName(this.serviceName);
        config.setServiceImplName(this.serviceImplName);
        config.setEntityName(this.entityName);
        return config;
    }

    private DataSourceConfig getDataSourceConfig() {
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setUrl(this.dbUrl);
        dsc.setDriverName(this.dbDriverName);
        dsc.setUsername(this.dbUserName);
        dsc.setPassword(this.dbPwd);
        return dsc;
    }

    private PackageConfig getPackageConfig() {
        PackageConfig pc = new PackageConfig();
        pc.setParent(this.packageName);
        pc.setEntity("entity");
        pc.setService(this.servicePkgName);
        pc.setServiceImpl(this.serviceImplPkgName);
        pc.setModuleName(this.moduleName);
        return pc;
    }

    private TemplateConfig getTemplateConfig() {
        TemplateConfig tc = new TemplateConfig();
        tc.setXml(null);
        tc.setController(null);
        if (this.isOnlyEntity()) {
            tc.setMapper(null);
        }
        return tc;
    }

    private InjectionConfig getInjectionConfig() {
        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
                // to do nothing
            }
        };
        // 如果模板引擎是 freemarker
        String templatePath = "/templates/mapper.xml.ftl";
        List<FileOutConfig> focList = new ArrayList<>();
        final StringBuilder xmlPath = new StringBuilder(projectPath + "/src/main/resources/mapper/");
        if (!StringUtils.isEmpty(this.moduleName)) {
            xmlPath.append(this.moduleName + "/");
        }
        focList.add(new FileOutConfig(templatePath) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输入文件名称
                return xmlPath.toString() + tableInfo.getMapperName() + StringPool.DOT_XML;
            }
        });
        cfg.setFileOutConfigList(focList);
        return cfg;
    }

    private StrategyConfig getStrategyConfig(String... tableNames) {
        StrategyConfig strategy = new StrategyConfig();
        strategy.setCapitalMode(false);
        strategy.setEntityLombokModel(true);
        strategy.setNaming(NamingStrategy.underline_to_camel);
//        //修改替换成你需要的表名，多个表名传数组
        strategy.setInclude(tableNames);
        if (null != this.getSuperEntityClass()) {
            strategy.setSuperEntityClass(this.getSuperEntityClass());
        }
        if (!StringUtils.isEmpty(this.getSuperServiceClass())) {
            strategy.setSuperServiceImplClass(this.superServiceClass);
        }
        return strategy;
    }

    public void genCode(String... tableNames) {
        AutoGenerator mpg = new AutoGenerator();
        mpg.setGlobalConfig(getGlobalConfig());
        mpg.setDataSource(getDataSourceConfig());
        mpg.setPackageInfo(getPackageConfig());
//        if (!this.isOnlyEntity()) {
//            mpg.setCfg(getInjectionConfig());
//        }
        mpg.setTemplate(getTemplateConfig());
        mpg.setStrategy(getStrategyConfig(tableNames));
        mpg.setTemplateEngine(new FreemarkerTemplateEngine());
        mpg.execute();
        // 删除entity包
        String path = projectPath + "/src/main/java/" + packageName.replace(".", "/") + "/" + moduleName + "/entity";

        boolean a = delete(path);
        if (!a) {
            throw new RuntimeException("多余文件删除失败，请手工删除：" + path);
        }
        System.out.println(projectPath + "/src/main/java/" + packageName.replace(".", "/") + "/" + moduleName + "/service/" + serviceName.replace("%s", StringUtils.capitalize(moduleName)));
//      import com.daidai.stdlsbackend.service
        String filePath1 = projectPath + "/src/main/java/" + packageName.replace(".", "/") + "/" + moduleName + "/service/" + serviceName.replace("%s", StringUtils.capitalize(moduleName))+".java";
        String filePath2 = projectPath + "/src/main/java/" + packageName.replace(".", "/") + "/" + moduleName + "/service/impl/" + serviceImplName.replace("%s", StringUtils.capitalize(moduleName))+".java";
        System.out.println(filePath2);
        autoReplace(filePath1, "import com.daidai.stdlsbackend.service", "import com.daidai.stdlsbackend.dao");
        autoReplace(filePath2, "import com.daidai.stdlsbackend.service"+"."+moduleName+".entity", "import com.daidai.stdlsbackend.dao"+"."+moduleName+".entity");
        autoReplace(filePath2, "import com.daidai.stdlsbackend.service"+"."+moduleName+".mapper", "import com.daidai.stdlsbackend.dao"+"."+moduleName+".mapper");
        // 替换service
//        File file = new File(projectPath + "/src/main/java/" + packageName.replace(".", "/") + "/" + moduleName+"/serviceName")
    }

    public boolean delete(String path) {
        File file = new File(path);
        if (!file.exists()) {
            return false;
        }
        if (file.isFile()) {
            return file.delete();
        }
        File[] files = file.listFiles();
        for (File f : files) {
            if (f.isFile()) {
                if (!f.delete()) {
                    System.out.println(f.getAbsolutePath() + " delete error!");
                    return false;
                }
            } else {
                if (!this.delete(f.getAbsolutePath())) {
                    return false;
                }
            }
        }
        return file.delete();
    }

    public void autoReplace(String filePath, String oldWord, String newWord) {
        File file = new File(filePath);
        Long fileLength = file.length();
        try {
            byte[] fileContext = new byte[fileLength.intValue()];
            FileInputStream in = new FileInputStream(filePath);
            in.read(fileContext);
            in.close();
            String str = new String(fileContext);

            str = str.replace(oldWord, newWord);

            PrintWriter out = new PrintWriter(filePath);
            out.write(str.toCharArray());
            out.flush();
            out.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
