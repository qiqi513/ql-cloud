import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

import java.util.ArrayList;
import java.util.List;

/**
 * @author qiqi
 * @date 2018/9/21 15:12
 */
public class Generate {


    private static String baseUrl = "G:\\git\\spring-cloud\\modules\\upms\\src\\main";;
    private static String author = "qiqi";
    private static String packageName = "com.qiqi.upms";
    private static String dbUrl = "jdbc:mysql://10.0.0.130:3306/cloud_upms";
    private static String userName = "root";
    private static String password = "123456";

    public static void main(String[] args) throws Exception{
        generateByTables( "upms_menu");
    }

    private static void generateByTables(  String... tableNames) {

        // 全局配置
        GlobalConfig gc  = new GlobalConfig();
        gc.setActiveRecord(false)
                .setMapperName("%sDao")
                .setServiceName("%sService")
                .setBaseResultMap(true)
                .setEnableCache(false)
                .setAuthor(author)
                .setOutputDir(baseUrl + "/java")
                .setFileOverride(true);



        DataSourceConfig dataSourceConfig = new DataSourceConfig();
        dataSourceConfig.setDbType(DbType.MYSQL)
                .setUrl(dbUrl)
                .setUsername(userName)
                .setPassword(password)
                .setDriverName("com.mysql.jdbc.Driver");


        StrategyConfig strategyConfig = new StrategyConfig();
        strategyConfig
                // .setCapitalMode(true)// 全局大写命名
                .setCapitalMode(true)
                .setEntityLombokModel(false)
                .setEntityLombokModel(true)
                .setRestControllerStyle(true)
                .setSuperControllerClass("com.qiqi.common.controller.BaseController")
                .setNaming(NamingStrategy.underline_to_camel)
                .setInclude(tableNames);//修改替换成你需要的表名，多个表名传数组

        // 自定义配置
        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
                // to do nothing
            }
        };
        List<FileOutConfig> focList = new ArrayList<>();
        focList.add(new FileOutConfig("/templates/mapper.xml.vm") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输入文件名称
                return baseUrl + "/resources/mapper/" + tableInfo.getEntityName() + "Mapper.xml";

            }
        });
        cfg.setFileOutConfigList(focList);


        // 代码生成器
        AutoGenerator mpg = new AutoGenerator();
        mpg.setGlobalConfig(gc)
                .setDataSource(dataSourceConfig)
                .setStrategy(strategyConfig)
                .setPackageInfo(
                        new PackageConfig()
                                .setParent(packageName)
                                .setController("controller")
                                .setEntity("model")
                                .setMapper("dao")
                )
                .setCfg(cfg).setTemplate(
                new TemplateConfig().setXml(null)
                // 自定义模板配置，模板可以参考源码 /mybatis-plus/src/main/resources/template 使用 copy
                // 至您项目 src/main/resources/template 目录下，模板名称也可自定义如下配置：
                // .setController("...");
                // .setEntity("...");
                // .setMapper("...");
                // .setXml("...");
                // .setService("...");
                // .setServiceImpl("...");
        )
                .execute();
    }
}
