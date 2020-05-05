[课程链接](https://www.bilibili.com/video/BV1QJ411v7bA)

# 1. Spring Boot简介

spring 诞生时是 Java 企业版（Java Enterprise Edition，JEE，也称 J2EE）的

轻量级代替品。无需开发重量级的 Enterprise JavaBean（EJB），Spring 为企业级

Java 开发提供了一种相对简单的方法，通过依赖注入和面向切面编程，用简单的Java 对象（Plain Old Java Object，POJO）实现了 EJB 的功能。

虽然 Spring 的组件代码是轻量级的，但它的配置却是重量级的。

第一阶段：xml配置

在Spring 1.x时代，使用Spring开发满眼都是xml配置的Bean，随着项目的扩大，我们需要把xml配置文件放到不同的配置文件里，那时需要频繁的在开发的类和配置文件之间进行切换

第二阶段：注解配置

在Spring 2.x 时代，随着JDK1.5带来的注解支持，Spring提供了声明Bean的注解（例如@Component、@Service），大大减少了配置量。主要使用的方式是应用的基本配置（如数据库配置）用xml，业务配置用注解

第三阶段：java配置

Spring 3.0 引入了基于 Java 的配置能力，这是一种类型安全的可重构配置方式，可以代替 XML。我们目前刚好处于这个时代，Spring4.x和Spring Boot都推荐使用Java配置。

所有这些配置都代表了开发时的损耗。 因为在思考 Spring 特性配置和解决业务问题之间需要进行思维切换，所以写配置挤占了写应用程序逻辑的时间。除此之外，项目的依赖管理也是件吃力不讨好的事情。决定项目里要用哪些库就已经够让人头痛的了，你还要知道这些库的哪个版本和其他库不会有冲突，这难题实在太棘手。并且，依赖管理也是一种损耗，添加依赖不是写应用程序代码。一旦选错了依赖的版本，随之而来的不兼容问题毫无疑问会是生产力杀手。

Spring Boot 让这一切成为了过去。

Spring Boot 简化了基于Spring的应用开发，只需要“run”就能创建一个独立的、生产级别的Spring应用。Spring Boot为Spring平台及第三方库提供开箱即用的设置（提供默认设置），这样我们就可以简单的开始。多数Spring Boot应用只需要很少的Spring配置。

我们可以使用SpringBoot创建java应用，并使用java –jar 启动它，或者采用传统的war部署方式。

 

Spring Boot 主要目标是：

l 为所有 Spring 的开发提供一个从根本上更快的入门体验

l 开箱即用，但通过自己设置参数，即可快速摆脱这种方式。

l 提供了一些大型项目中常见的非功能性特性，如内嵌服务器、安全、指标，健康检测、外部化配置等

l 绝对没有代码生成，也无需 XML 配置。

# 2.spingBoot入门

## 2.1spring的HelleWord

1. 创建一个Maven工程

   ```xml
   <groupId>com.itheima</groupId>
   <artifactId>heima_springBoot</artifactId>
   ```

2. 导入spring boot相关的依赖

   ```xml
       <parent>
           <groupId>org.springframework.boot</groupId>
           <artifactId>spring-boot-starter-parent</artifactId>
           <version>2.0.5.RELEASE</version>
       </parent>
       <dependencies>
           <dependency>
              <groupId>org.springframework.boot</groupId>
              <artifactId>spring-boot-starter-web</artifactId>
           </dependency>
       </dependencies>
       <properties>
           <java.version>1.8</java.version>
       </properties>
   
   ```

3. 编写一个主程序，启动Spring Boot应用

   ```java
   /**
    *  @SpringBootApplication 来标注一个主程序类，说明这是一个Spring Boot应用
    */
   @SpringBootApplication
   public class Application {
   
       public static void main(String[] args) {
   
           // Spring应用启动起来
           SpringApplication.run(Application.class,args);
       }
   }
   ```

4. 编写相关的Controller、Service

   ```java
   @Controller
   public class HelloController {
   
       @ResponseBody
       @RequestMapping("/hello")
       public String hello(){
           return "Hello World!";
       }
   }
   ```

5. 运行主程序

   浏览器输入即可查看http://localhost:8080/hello

6. 简化部署

   ```xml
    <!-- 这个插件，可以将应用打包成一个可执行的jar包；-->
       <build>
           <plugins>
               <plugin>
                   <groupId>org.springframework.boot</groupId>
                   <artifactId>spring-boot-maven-plugin</artifactId>
               </plugin>
           </plugins>
       </build>
   ```

## 2.2Java代码方式配置

以数据库druid连接池为例

1. 在pom.xml配置druid依赖

```xml
<dependency>
    <groupId>com.alibaba</groupId>
    <artifactId>druid</artifactId>
    <version>1.1.10</version>
</dependency>
```

2.新建jdbc.properties文件

在resources下新建jdbc.properties，然后配置下列信息

```
jdbc.driver=com.mysql.jdbc.Driver
jdbc.url=jdbc:mysql://127.0.0.1:3306/springboot
jdbc.username=root
jdbc.password=root123
```

3. 编写配置类

   ```java
   package com.itheima.config;
   
   import com.alibaba.druid.pool.DruidDataSource;
   import org.springframework.beans.factory.annotation.Value;
   import org.springframework.context.annotation.Bean;
   import org.springframework.context.annotation.Configuration;
   import org.springframework.context.annotation.PropertySource;
   
   import javax.sql.DataSource;
   
   @Configuration
   @PropertySource("classpath:jdbc.properties")
   public class JdbcConfig {
       @Value("${jdbc.driverClassName}")
       private String driverClassName;
       @Value("${jdbc.url}")
       private String url;
       @Value("${jdbc.username}")
       private String username;
       @Value("${jdbc.password}")
       private String password;
   
      @Bean
       public DataSource dataSource(){
           DruidDataSource dataSource=new DruidDataSource();
           dataSource.setDriverClassName(driverClassName);
           dataSource.setUrl(url);
           dataSource.setUsername(username);
           dataSource.setPassword(password);
           return dataSource;
       }
   }
   ```

   > 小知识
   >
   > 1. **@Configuration和@Bean**
   >
   >    [此处参考笔记](https://www.jianshu.com/p/8268b58daa57)
   >
   >    @Configuration定义：指示一个类声明一个或者多个@Bean 声明的方法并且由Spring容器统一管理，以便在运行时为这些bean生成bean的定义和服务请求的类。例如：
   >
   >    ```java
   >    @Configuration
   >    public class AppConfig {
   >    
   >      @Bean
   >      public MyBean myBean(){
   >        return new MyBean();
   >      }
   >    }
   >    ```
   >
   >    上述AppConfig 加入@Configuration 注解，表明这就是一个配置类。有一个myBean()的方法，返回一个MyBean()的实例，并用@Bean 进行注释，表明这个方法是需要被Spring进行管理的bean。@Bean 如果不指定名称的话，默认使用myBean名称，也就是小写的名称。
   >
   >    ```java
   >     @Configuation等价于<Beans></Beans>
   >    
   >     @Bean等价于<Bean></Bean>
   >    ```
   >
   >    ### 基于ComponentScan() 来获取Bean的定义
   >
   >    **@Configuration 使用@Component 进行原注解，因此@Configuration 类也可以被组件扫描到（特别是使用XML元素）。**
   >
   >    在这里认识几个注解: @Controller, @Service, @Repository, @Component
   >
   >    - @Controller: 表明一个注解的类是一个"Controller"，也就是控制器，可以把它理解为MVC 模式的Controller 这个角色。这个注解是一个特殊的@Component，允许实现类通过类路径的扫描扫描到。它通常与@RequestMapping 注解一起使用。
   >    - @Service: 表明这个带注解的类是一个"Service"，也就是服务层，可以把它理解为MVC 模式中的Service层这个角色，这个注解也是一个特殊的@Component，允许实现类通过类路径的扫描扫描到
   >    - @Repository: 表明这个注解的类是一个"Repository",团队实现了JavaEE 模式中像是作为"Data Access Object" 可能作为DAO来使用，当与 PersistenceExceptionTranslationPostProcessor 结合使用时，这样注释的类有资格获得Spring转换的目的。这个注解也是@Component 的一个特殊实现，允许实现类能够被自动扫描到
   >    - @Component: 表明这个注释的类是一个组件，当使用基于注释的配置和类路径扫描时，这些类被视为自动检测的候选者。
   >
   >    也就是说，上面四个注解标记的类都能够通过@ComponentScan 扫描到，上面四个注解最大的区别就是使用的场景和语义不一样，比如你定义一个Service类想要被Spring进行管理，你应该把它定义为@Service 而不是@Controller因为我们从语义上讲，@Service更像是一个服务的类，而不是一个控制器的类，@Component通常被称作组件，它可以标注任何你没有严格予以说明的类，比如说是一个配置类，它不属于MVC模式的任何一层，这个时候你更习惯于把它定义为 @Component。@Controller，@Service，@Repository 的注解上都有@Component，所以这三个注解都可以用@Component进行替换。
   >
   > 2. **@PropertySource**
   >
   >    ```java
   >    @PropertySource("classpath:jdbc.properties")
   >    ```
   >
   >    Spring框架提供了PropertySource注解，目的是加载指定的属性文件
   >
   >    @PropertySource用于引入单个配置文件
   >
   >    @PropertySources用于引入多个配置文件
   >
   >    @PropertySource或者@PropertySources引入的数据都是存在环境变量ConfigurableEnvironment中的
   >
   > 3. **@Value**
   >
   >    该注解作用的作用是将我们配置文件的属性读出来，有@Value("${}")和@Value("#{}")两种方式
   >
   >    @value几种数值填充方式
   >
   >    1. 基本数值的填充 
   >    2. 基于SpEl表达式#{} 
   >    3. 基于配置文件${配置文件中参数名}
   >
   >    @Value注解作用的两种方式
   >
   >    第一种方式@Value("${}"):在使用Springboot项目搭建的项目时，配置文件application.properties中
   >
   >    已经被加载到了项目中,在项目中可以通过该注解获取配置文件中的信息
   >
   >    第二种方式@Value("#{}"):两种的注解区别在值上的区别为：
   >
   >    　　　　@Value的值有两类：
   >    　　　　① ${ property : default_value }
   >    　　　　② #{ obj.property? :default_value }
   >    　　　　第一个注入的是外部配置文件对应的property，第二个则是SpEL表达式对应的内容。 那个
   >    　　　　default_value，就是前面的值为空时的默认值。注意二者的不同，#{}里面那个obj代表对象。
   >
   >
   >    　　就是说，在使用该注解的时候，书写上根据对象.属性来获取值，而@Value("${}")是直接根据配置文件
   >
   >    　　中的属性获取信息。
   >
   >    https://www.cnblogs.com/liuqijia/p/11428789.html
   >
   >    首先在xml中定义一个bean如下：把对应的参数以property中value的形式注入
   >
   >    ```xml
   >    <!-- 定义一个id为user的bean对象 -->
   >        <bean id="user" class="com.zhang.bean.User">
   >            <property name="age" value="26"></property>
   >            <property name="userName" value="zhangsan"></property>
   >        </bean>
   >    ```

## 2.3springBoot属性注入方式

实现步骤：

1. 创建JdbcProperties配置项类，在类名上面添加@ConfigurationProperties注解

   ConfigurationProperties注解到类上

   ```java
   package com.itheima.config;
   
   import org.springframework.boot.context.properties.ConfigurationProperties;
   
   /**
    *ConfigurationProperties从application配置文件中读取配置
    *prefix 表示配置项的前缀
    * 配置项类中的类变量名必须要与 前缀之后的配置项名保持松散绑定（相同）
    */
   @ConfigurationProperties(prefix = "jdbc")
   public class JdbcProperties {
       private String driverClassName;
       private String url;
       private String username;
       private String password;
   
       public String getDriverClassName() {
           return driverClassName;
       }
   	//此处省略get/set方法
   }
   ```

   同时添加pom依赖

   ```
   <dependency>
       <groupId>org.springframework.boot</groupId>
       <artifactId>spring-boot-configuration-processor</artifactId>
       <!--不传递依赖-->
       <optional>true</optional>
   </dependency>
   ```

2. 将jdbc.properties改名为application.properties

3. 将JdbcProperties对象注入到JdbcConfig

   ```java
   package com.itheima.config;
   
   import com.alibaba.druid.pool.DruidDataSource;
   import org.springframework.beans.factory.annotation.Value;
   import org.springframework.boot.context.properties.EnableConfigurationProperties;
   import org.springframework.context.annotation.Bean;
   import org.springframework.context.annotation.Configuration;
   import org.springframework.context.annotation.PropertySource;
   
   import javax.sql.DataSource;
   
   @Configuration
   //@PropertySource("classpath:jdbc.properties")
   @EnableConfigurationProperties(JdbcProperties.class)
   public class JdbcConfig {
   /*    @Value("jdbc.driverClassName")
       private String driverClassName;
       @Value("${jdbc.url}")
       private String url;
       @Value("${jdbc.username}")
       @Value("${jdbc.password}")
       private String password;
   
      @Bean
       public DataSource dataSource(){
           DruidDataSource dataSource=new DruidDataSource();
           dataSource.setDriverClassName(driverClassName);
           dataSource.setUrl(url);
           dataSource.setUsername(username);
           dataSource.setPassword(password);
           return dataSource;
       }*/
   
       @Bean
       public DataSource dataSource(JdbcProperties jdbcProperties){
           DruidDataSource dataSource=new DruidDataSource();
           dataSource.setDriverClassName(jdbcProperties.getDriverClassName());
           dataSource.setUrl(jdbcProperties.getUrl());
           dataSource.setUsername(jdbcProperties.getUsername());
           dataSource.setPassword(jdbcProperties.getPassword());
           return dataSource;
       }
   }
   ```

   更优雅的一种注入方式：

   先取消JdbcProperties的ConfigurationProperties注解

   ```java
   package com.itheima.config;
   
   import org.springframework.boot.context.properties.ConfigurationProperties;
   
   /**
    *ConfigurationProperties从application配置文件中读取配置
    *prefix 表示配置项的前缀
    * 配置项类中的类变量名必须要与 前缀之后的配置项名保持松散绑定（相同）
    */
   //@ConfigurationProperties(prefix = "jdbc")
   public class JdbcProperties {
       private String driverClassName;
       private String url;
       private String username;
       private String password;
   //此处省略get/set方法
   }
   ```

   再修改JdbcConfig，直接ConfigurationProperties注解到方法上

   ```java
   package com.itheima.config;
   
   import com.alibaba.druid.pool.DruidDataSource;
   import org.springframework.beans.factory.annotation.Value;
   import org.springframework.boot.context.properties.ConfigurationProperties;
   import org.springframework.boot.context.properties.EnableConfigurationProperties;
   import org.springframework.context.annotation.Bean;
   import org.springframework.context.annotation.Configuration;
   import org.springframework.context.annotation.PropertySource;
   
   import javax.sql.DataSource;
   
   @Configuration
   //@PropertySource("classpath:jdbc.properties")
   //@EnableConfigurationProperties(JdbcProperties.class)
   public class JdbcConfig {
   /*    @Value("jdbc.driverClassName")
       private String driverClassName;
       @Value("${jdbc.url}")
       private String url;
       @Value("${jdbc.username}")
       @Value("${jdbc.password}")
       private String password;
   
      @Bean
       public DataSource dataSource(){
           DruidDataSource dataSource=new DruidDataSource();
           dataSource.setDriverClassName(driverClassName);
           dataSource.setUrl(url);
           dataSource.setUsername(username);
           dataSource.setPassword(password);
           return dataSource;
       }*/
   
   /*    @Bean
       public DataSource dataSource(JdbcProperties jdbcProperties){
           DruidDataSource dataSource=new DruidDataSource();
           dataSource.setDriverClassName(jdbcProperties.getDriverClassName());
           dataSource.setUrl(jdbcProperties.getUrl());
           dataSource.setUsername(jdbcProperties.getUsername());
           dataSource.setPassword(jdbcProperties.getPassword());
           return dataSource;
       }*/
       @Bean
       @ConfigurationProperties(prefix = "jdbc")
       public DataSource dataSource(){
           return new DruidDataSource();
       }
   }
   ```

   > 小知识
   >
   > 1. **@ConfigurationProperties**
   >
   >    [此处参考笔记链接](https://blog.csdn.net/yusimiao/article/details/97622666)
   >
   >    @ConfigurationProperties 的基本用法非常简单:我们为每个要捕获的外部属性提供一个带有字段的类。请注意以下几点:
   >
   >    前缀定义了哪些外部属性将绑定到类的字段上
   >    根据 Spring Boot 宽松的绑定规则，类的属性名称必须与外部属性的名称匹配
   >    我们可以简单地用一个值初始化一个字段来定义一个默认值
   >    类本身可以是包私有的
   >    类的字段必须有公共 setter 方法
   >
   >    Spring Boot 项目中，为满足以上要求，我们将大量的参数配置在 application.properties 或 application.yml 文件中，通过 `@ConfigurationProperties` 注解，我们可以方便的获取这些参数值
   >
   >    我们可以使用 `@Value` 注解或着使用 Spring `Environment` bean 访问这些属性，这种注入配置方式有时显得很笨重。我们将使用更安全的方式(`@ConfigurationProperties` )来获取这些属性
   >
   >    Spring 宽松绑定规则 (relaxed binding)
   >
   >    Spring使用一些宽松的绑定属性规则。因此，以下变体都将绑定到 hostName 属性上:
   >
   >    **激活 @ConfigurationProperties**
   >
   >    * 首先，我们可以通过添加 @Component 注解让 Component Scan 扫描到
   >
   >      很显然，只有当类所在的包被 Spring `@ComponentScan` 注解扫描到才会生效，默认情况下，该注解会扫描在主应用类下的所有包结构
   >
   >    * 我们也可以通过 Spring 的 Java Configuration 特性实现同样的效果:	
   >
   >    * 我们还可以使用 `@EnableConfigurationProperties` 注解让我们的类被 Spring Boot 所知道，在该注解中其实是用了`@Import(EnableConfigurationPropertiesImportSelector.class)` 实现
   >
   > 2. @EnableConfigurationProperties
   >
   >    使使用 @ConfigurationProperties 注解的类生效。
   >
   >    如果一个配置类只配置@ConfigurationProperties注解，而没有使用@Component，那么在IOC容器中是获取不到properties 配置文件转化的bean。说白了 @EnableConfigurationProperties 相当于把使用  @ConfigurationProperties 的类进行了一次注入。
   >
   >    * 如果@ConfigurationProperties所注的类可以被springboot扫描并添加进容器中作为bean（比如使用@Component等注解，或者配置扫描该类所在包等手段），那么spring容器会自动使该类上的@ConfigurationProperties生效，创建一个该类的实例，然后把对应配置属性绑定进该实例，再把该实例作为bean添加进spring容器。
   >
   >    * 如果该类只使用了@ConfigurationProperties注解，然后该类没有在扫描路径下或者没有使用@Component等注解，导致无法被扫描为bean，那么就必须在配置类上使用@EnableConfigurationProperties注解去指定这个类，这个时候就会让该类上的@ConfigurationProperties生效，然后作为bean添加进spring容器中
   >
   >    * 在javaconfig中@ConfigurationProperties与@Bean一起用，也是把配置文件中的属性注入该@Bean对应的要添加到容器中的bean实例中。

## 2.4多个yml文件配置

yml与properties配置文件除了展示形式不相同以外，其他功能和作用都是一样的，在项目中的读取方式不变。

1. yml配置文件的特征：

   * 树状层级结构展示配置项

   * 配置项之间如果有关系的话需要分行空两格

   * 配置项如果有值的话，那么需要在`:`之后空一格再写配置项值

将application.properties修改为application.yml的话：

```yml
jdbc:
  driverClassName: com.mysql.jdbc.Driver
  url: jdbc:mysql://127.0.0.1:3306/springboot
  username: root
  password: root123
  #集合用-标示字段名第一个第二个...
```

2. 多个yml配置文件

   在spring boot中多个yml配置文件上被允许的，这些配置文件的名称必须为application-***.yml，并且这些配置文件必须要在application.yml配置文件中激活之后才可以使用

   比如分别增加application-baidu.yml和application-google.yml

   `application-baidu.yml`

   ```yml
   baidu:
     url: www.baidu.com
   ```

   `application-google.yml`

   ```yml
   google:
     url: www.google.com
   ```

   在application.yml配置文件中激活

   ```yml
   jdbc:
     driverClassName: com.mysql.jdbc.Driver
     url: jdbc:mysql://127.0.0.1:3306/springboot
     username: root
     password: root123
   
     #激活其他配置文件
   spring:
     profiles:
       active: baidu,google
   ```

   然后在代码里即可引用

   ```java
   @Value("${baidu.url}")
   private String baiduUrl;
   
   @Value("${google.url}")
   private String googleUrl;
   ```

3. 如果properties和yml配置文件同时存在在spring boot项目中，那么这两个配置文件都有效。两个配置文件中如果同时存在同名的配置项的话，会以properties文件的为主

# 4.自动配置原理

整合其他框架组建流程：

在META-INF\spring.fatories文件中定义了很多自动配置类，可以根据在pom.xml中添加的启动器依赖自动装配组建

springBoot整合**框架

1. 查看配置项，在maven依赖里找到spring-boot-autoconfigure-x.x.x.RELEASE.jar
2. 找到**框架所在的package
3. 找到**Properties类，查看对该框架可以配置的配置项，prefix+配置项，prefix是有值的，比如prefix = "spring.mvc"，不同的框架prefix有不同的值
4. 添加和修改resources下的application.yml，设置**框架的配置项

# 5.springBoot整合

## 5.1lombok应用

使用lombok的注解简化pojo类的简化

Lombok能通过注解的方式，在编译时自动为属性生成构造器、getter/setter、equals、hashcode、toString方法。出现的神奇就是在源码中没有getter和setter方法，但是在编译生成的字节码文件中有getter和setter方法。这样就省去了手动重建这些代码的麻烦，使代码看起来更简洁些。

1. 在IDEA中安装lombok插件

   `File`->`Settings`->`Plugins`

   点`Browse repositories`，搜索lombok，`install`安装即可，安装完成后，重启IDEA

2. 添加lombok对应的依赖到pom.xml文件

   ```xml
   <!--lombok依赖-->
   <dependency>
       <groupId>org.projectlombok</groupId>
       <artifactId>lombok</artifactId>
   </dependency>
   ```

3. 改造实体类使用lombok注解

   ```java
   package com.itheima.entity;
   
   import lombok.Data;
   import lombok.extern.slf4j.Slf4j;
   
   import java.util.Date;
   
   //在编译阶段会很据注解自动生成对应方法；
   //@Data注解包含get/set/hashCode/equals/toString等方法
   @Data
   @Slf4j
   public class User {
       private String id;
   
       private String userName;
   
       private String password;
   
       private String name;
   
       private Integer age;
   
       private String sex;
   
       private Date birthday;
   
       private String note;
   
       private Date created;
   
       private Date updated;
   }
   ```

   建表语句

   ```mysql
   SET FOREIGN_KEY_CHECKS=0;
   
   -- ----------------------------
   -- Table structure for tb_user
   -- ----------------------------
   DROP TABLE IF EXISTS `tb_user`;
   CREATE TABLE `tb_user` (
     `id` varchar(32) NOT NULL COMMENT '主键',
     `user_name` varchar(20) default NULL COMMENT '用户名',
     `password` varchar(20) default NULL COMMENT '密码',
     `name` varchar(255) default NULL COMMENT '姓名',
     `age` int(11) default NULL COMMENT '年龄',
     `sex` varchar(6) default NULL COMMENT '性别',
     `birthday` date default NULL COMMENT '生日',
     `note` varchar(200) default NULL COMMENT '笔记',
     `created` timestamp NULL default NULL COMMENT '创建时间',
     `updated` timestamp NULL default NULL COMMENT '更新时间',
     PRIMARY KEY  (`id`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
   
   -- ----------------------------
   -- Records of tb_user
   -- ----------------------------
   INSERT INTO `tb_user` VALUES ('1', 'zhangsan', '123456', '张三', '20', '1', '1998-06-16', '张三在学习springBoot', '2020-05-04 18:08:20', '2020-05-04 18:08:23');
   
   ```

4. 总结

   在Bean上使用

   @Data：注解包含getter/setert/hashCode/equals/toString等方法

   @Getter：自动提供getter方法

   @Setter：自动提供setter方法

   @Slf4j：自动在bean中提供log变量，其实使用的是slf4j的日志功能

   ```java
   log.info("这是用@Slf4j打出来的日志");
   ```

## 5.2整合SpringMVC端口和静态资源

1. 修改tomcat端口

   查询**Properties，修改tomcat端口找ServerProperties， {设置配置项（前缀+类变量名）到application.yml中

   ```yml
   server:
     port: 80
   ```

2. 访问项目中的静态资源

   在resources下新建文件夹static，将图片、js、css文件放到static文件夹下

   在ResourceProperties源码中可以看到静态资源可以放到一下路径

   ```java
   {"classpath:/META-INF/resources/", "classpath:/resources/", "classpath:/static/", "classpath:/public/"}
   ```

## 5.3整合SpringMVC拦截器

1. 编写拦截器（实现HandlerInterceptor）

   自定义SpringMVC拦截器

   ```java
   package com.itheima.interceptor;
   
   import lombok.extern.slf4j.Slf4j;
   import org.springframework.web.servlet.HandlerInterceptor;
   import org.springframework.web.servlet.ModelAndView;
   
   import javax.servlet.http.HttpServletRequest;
   import javax.servlet.http.HttpServletResponse;
   
   @Slf4j
   public class MyInterceptor implements HandlerInterceptor {
       @Override
       public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
           log.debug("这是MyInterceptor的preHandle方法");
           return true;
       }
   
       @Override
       public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
           log.debug("这是MyInterceptor的postHandle方法");
       }
   
       @Override
       public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
           log.debug("这是MyInterceptor的afterCompletion方法");
       }
   }
   ```

   > 小知识
   >
   > HandlerInterceptor的preHandle、postHandle、afterCompletion方法的作用
   >
   > [此处笔记参考链接](https://blog.csdn.net/weixin_41767154/article/details/84648873)
   >
   > *  preHandle方法是进行处理器拦截用的，顾名思义，该方法将在Controller处理之前进行调用。
   >
   > * postHandle方法只会在当前这个Interceptor的preHandle方法返回值为true的时候才会执行
   >
   >   是进行处理器拦截用的，它的执行时间是在处理器进行处理之后，也就是在Controller的方法调用**之后执行**，但是它会在DispatcherServlet进行视图的渲染**之前执行**，也就是说在这个方法中你可以对ModelAndView进行操作
   >
   >   这个方法的链式结构跟正常访问的方向是相反的，也就是说先声明的Interceptor拦截器该方法反而会后调用
   >
   > * afterCompletion方法需要当前对应的Interceptor的preHandle方法的返回值为true时才会执行
   >
   >   该方法将在整个请求完成之后，也就是DispatcherServlet渲染了视图执行

   在application.yml里设置日志级别

   ```yml
   #配置日志级别
   logging:
     level:
       com.itheima: debug
       org.springframework: info
   ```

2. 编写配置类实现WebMvcConfigurer，在该类中添加各种组件

   ```
   package com.itheima.config;
   
   import com.itheima.interceptor.MyInterceptor;
   import org.springframework.context.annotation.Bean;
   import org.springframework.context.annotation.Configuration;
   import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
   import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
   
   @Configuration
   public class MvcConfig implements WebMvcConfigurer {
       //注册拦截器
       @Bean
       public MyInterceptor myInterceptor(){
           return new MyInterceptor();
       }
       //添加拦截器到springMvc拦截器里
   
       @Override
       public void addInterceptors(InterceptorRegistry registry) {
           registry.addInterceptor(myInterceptor()).addPathPatterns("/*");
       }
   }
   ```

## 5.4整合事务和连接池

**目标**：配置Spring Boot自带默认的hikari数据库连接池和使用@Transactional注解进行事务配置

**分析**

1. 事务配置

   * 添加事务相关的启动器依赖，mysql相关依赖

     spring中的jdbc连接和事务是配置中重要的一环，在SpringBoot中该如何处理呢？

     答案是不需要处理，我们只要找到SpringBoot提供的启动器即可，	在`pom.xml`中添加如下依赖：

     ```xml
     <!--springBoot中jdbc依赖-->
     <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-starter-jdbc</artifactId>
     </dependency>
     ```

     `mysql`

     ```xml
     <!--mysql依赖-->
     <dependency>
         <groupId>mysql</groupId>
         <artifactId>mysql-connector-java</artifactId>
         <version>5.1.46</version>
     </dependency>
     ```

   * 编写业务累UserService使用@Transactional注解

2. 数据库连接池hikari配置

   只需要在application配置文件中指定数据库相关参数

   ```yml
   spring:
     #hikari数据库连接池配置，springBoot默认的
     datasource:
       driver-class-name: com.mysql.jdbc.Driver
       url: jdbc:mysql://127.0.0.1:3306/springboot
       username: root
       password: root123
   ```

   同时在JdbcConfig里废弃`阿里巴巴druid`连接池的配置

   但是DataSource的引用出是不需要修改的，因为springBoot已经帮我们整合好了，我们只需要配置jdbc即可

   ```java
   package com.itheima.config;
   
   import com.alibaba.druid.pool.DruidDataSource;
   import org.springframework.beans.factory.annotation.Value;
   import org.springframework.boot.context.properties.ConfigurationProperties;
   import org.springframework.boot.context.properties.EnableConfigurationProperties;
   import org.springframework.context.annotation.Bean;
   import org.springframework.context.annotation.Configuration;
   import org.springframework.context.annotation.PropertySource;
   
   import javax.sql.DataSource;
   //由于采用了hikari的连接池，因此在这里注释掉@Configuration，废弃Druid
   //@Configuration
   //@PropertySource("classpath:jdbc.properties")
   //@EnableConfigurationProperties(JdbcProperties.class)
   public class JdbcConfig {
   /*    @Value("jdbc.driverClassName")
       private String driverClassName;
       @Value("${jdbc.url}")
       private String url;
       @Value("${jdbc.username}")
       @Value("${jdbc.password}")
       private String password;
   
      @Bean
       public DataSource dataSource(){
           DruidDataSource dataSource=new DruidDataSource();
           dataSource.setDriverClassName(driverClassName);
           dataSource.setUrl(url);
           dataSource.setUsername(username);
           dataSource.setPassword(password);
           return dataSource;
       }*/
   
   /*    @Bean
       public DataSource dataSource(JdbcProperties jdbcProperties){
           DruidDataSource dataSource=new DruidDataSource();
           dataSource.setDriverClassName(jdbcProperties.getDriverClassName());
           dataSource.setUrl(jdbcProperties.getUrl());
           dataSource.setUsername(jdbcProperties.getUsername());
           dataSource.setPassword(jdbcProperties.getPassword());
           return dataSource;
       }*/
   //由于采用了hikari的连接池，因此在这里注释掉数据源，废弃Druid的
   /*    @Bean
       @ConfigurationProperties(prefix = "jdbc")
       public DataSource dataSource(){
           return new DruidDataSource();
       }*/
   }
   ```

5.5整合Mybatis

 **目标**：配置Mybatis在SpringBoot工程中的整合包，设置Mybatis的实体类别名，输出执行sql语句配置项

**分析**：

1. 添加启动器依赖

   springBoot官方并没有提供Mybatis的启动器，不过Mybatis官网自己实现了。在项目的`pom.xml`文件中加入如下依赖：

   ```xml
   <!--mybatis依赖-->
   <dependency>
       <groupId>org.mybatis.spring.boot</groupId>
       <artifactId>mybatis-spring-boot-starter</artifactId>
       <version>1.3.1</version>
   </dependency>
   ```

2. 配置Mybatis：实体类别名包，日志，映射文件等

   ```yml
   #mybatis配置
   mybatis:
     #实体类别名包路径
     type-aliases-package: com.itheima.entity
     #映射文件路径
     #mapper-locations: classpath:mappers/*.xml
     configuration:
       #日志配置：后台输出
       log-impl: org.apache.ibatis.logging.stdout.StdOutImpl
   ```

3. 配置MapperScan

   新建业务mapper接口

   ```java
   package com.itheima.mapper;
   
   import org.apache.ibatis.annotations.Mapper;
   //可以用@Mapper，但是这里不推荐使用，我们可以在Application启动类里统一扫描配置
   //@Mapper
   public interface UserMapper {
   }
   ```

   在Application启动器里统一配置MapperScan

   ```java
   package com.itheima;
   
   import org.mybatis.spring.annotation.MapperScan;
   import org.springframework.boot.SpringApplication;
   import org.springframework.boot.autoconfigure.SpringBootApplication;
   
   /**
    * @SpringBootApplication 来标注一个主程序类，这是工程的入口类
    * 说明这是一个Spring Boot应用
    */
   @SpringBootApplication
   //扫描myBatis所有的业务mapper接口
   @MapperScan("com.itheima.mapper")
   public class Application {
       public static void main(String[] args) {
           //Spring应用启动起来
           SpringApplication.run(Application.class,args);
       }
   }
   ```

## 5.6整合通用Mapper

**目标**：配置通用Mapper组组件到SpringBoot项目中，并使用Mapper<T>范型接口

**分析**：

1. 添加启动器依赖

   通用Mapper的作者也为自己的插件编写了启动器，我们直接引入即可。在项目的`pom.xml`文件中加入如下依赖：

   ```xml
   <!--通用Mapper依赖-->
   <dependency>
     <groupId>tk.mybatis</groupId>
     <artifactId>mapper-spring-boot-starter</artifactId>
     <version>2.1.5</version>
   </dependency>
   ```

2. 改造Usermapper继承Mapper<User>

   ```java
   package com.itheima.mapper;
   
   import com.itheima.entity.User;
   import tk.mybatis.mapper.common.Mapper;
   
   //import org.apache.ibatis.annotations.Mapper;
   //可以用@Mapper，但是这里不推荐使用，我们可以在Application启动类里统一扫描配置
   //@Mapper
   public interface UserMapper extends Mapper<User> {
   }
   ```

3. 修改启动器引导类Application中的Mapper扫描注解

   ```java
   package com.itheima;
   
   //import org.mybatis.spring.annotation.MapperScan;
   import org.springframework.boot.SpringApplication;
   import org.springframework.boot.autoconfigure.SpringBootApplication;
   import tk.mybatis.spring.annotation.MapperScan;
   
   /**
    * @SpringBootApplication 来标注一个主程序类，这是工程的入口类
    * 说明这是一个Spring Boot应用
    */
   @SpringBootApplication
   //扫描myBatis所有的业务mapper接口
   //@MapperScan("com.itheima.mapper")
   @MapperScan("com.itheima.mapper")
   public class Application {
       public static void main(String[] args) {
           //Spring应用启动起来
           SpringApplication.run(Application.class,args);
       }
   }
   ```

4. 修改User实体类，添加jpa注解

   ```java
   package com.itheima.entity;
   
   import lombok.Data;
   import lombok.extern.slf4j.Slf4j;
   import tk.mybatis.mapper.annotation.KeySql;
   
   import javax.persistence.Id;
   import javax.persistence.Table;
   import java.util.Date;
   
   //在编译阶段会很据注解自动生成对应方法；
   //@Data注解包含get/set/hashCode/equals/toString等方法
   @Data
   @Slf4j
   @Table(name="tb_user")
   public class User {
       @Id
       //主键回填
       @KeySql(useGeneratedKeys = true)
       private String id;
   
       private String userName;
   
       private String password;
   
       private String name;
   
       private Integer age;
   
       private String sex;
   
       private Date birthday;
   
       private String note;
   
       private Date created;
   
       private Date updated;
   }
   ```

5. 改造UserService实现业务功能

   ```java
   package com.itheima.service;
   
   import com.itheima.entity.User;
   import com.itheima.mapper.UserMapper;
   import lombok.extern.slf4j.Slf4j;
   import org.springframework.beans.factory.annotation.Autowired;
   import org.springframework.stereotype.Service;
   import org.springframework.transaction.annotation.Transactional;
   
   @Slf4j
   @Service
   public class UserService {
       @Autowired
       private UserMapper userMapper;
       //根据id查询
       public User findUserById(String id){
           //return  new User();
           return userMapper.selectByPrimaryKey(id);
       }
       //新增保存用户
       @Transactional
       public void save(User user){
           log.debug("-----新增用户");
           //insertSelective选择性新增，如果属性值为空则该属性值不会出现在insert语句上
           userMapper.insertSelective(user);
          //userMapper.insert(user);
       }
   }
   ```

## 5.7整合测试

```java
package com.itheima.controller;

import com.itheima.entity.User;
import com.itheima.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.sql.DataSource;
@Slf4j
@RestController
public class HelloController {
    @Autowired
    private DataSource dataSource;

    @Value("${baidu.url}")
    private String baiduUrl;

    @Value("${google.url}")
    private String googleUrl;

    @Autowired
    private UserService userService;

    @RequestMapping("/hello")
    public String hello(){
        System.out.println(dataSource);
        System.out.println(baiduUrl);
        System.out.println(googleUrl);
        User user=userService.findUserById("1");
        log.info("这是用@Slf4j打出来的日志");
        return "Hello World!";
    }

    @RequestMapping("/user/{id}")
    public User findUserById(@PathVariable String id){
        log.info("查询用户id是{}",id);
        User user=userService.findUserById(id);
        return user;
    }
}
```

## 5.8整合Junit

**目标**：在springBoot项目中使用Junit进行单元测试UserService的方法

**分析**：

1. 添加启动器依赖

   ```xml
   <!--Junit依赖-->
   <dependency>
       <groupId>org.springframework.boot</groupId>
       <artifactId>spring-boot-starter-test</artifactId>
   </dependency>
   ```

2. 编写测试类

   快捷键：选择要测试的类，`Ctrl+Shift+T`，然后选中测试要生对应的方法即可。

   然后在测试类上增加下面两个注解

   ```java
   @RunWith(SpringRunner.class)
   @SpringBootTest
   ```

   测试类如下：

   ```java
   package com.itheima.service;
   
   import com.itheima.entity.User;
   import org.junit.Test;
   import org.junit.runner.RunWith;
   import org.springframework.beans.factory.annotation.Autowired;
   import org.springframework.boot.test.context.SpringBootTest;
   import org.springframework.test.context.junit4.SpringRunner;
   
   import static org.junit.Assert.*;
   
   @RunWith(SpringRunner.class)
   @SpringBootTest
   public class UserServiceTest {
       @Autowired
       private  UserService userService;
       @Test
       public void findUserById() {
           userService.findUserById("1");
       }
   
       @Test
       public void save() {
           User user=new User();
                user.setId("2");
           userService.save(user);
       }
   }
   ```

> 小知识

## 5.9整合Redis

**目标**：在springBoot项目中使用Junit进行单元测试RedisTemplate的使用

**分析**：

1. 添加启动器依赖

   ```xml
   <!--Redis依赖-->
   <dependency>
       <groupId>org.springframework.boot</groupId>
       <artifactId>spring-boot-starter-data-redis</artifactId>
   </dependency>
   ```

2. 配置application.yml，修改Redis的连接参数（Redis需要启动）

   ```yml
   spring:
     #配置redis
     redis:
       host: localhost
       port: 6739
   ```

3. 编写测试应用RedisTemplate操作Redis中的五种数据类型（string/hash/list/set/sorted set）

```java
package com.itheima.service.redis;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
import java.util.Set;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RedisTest {
    private RedisTemplate redisTemplate;

    @Test
    public void test(){
    //字符串
        //redisTemplate.opsForValue().set("str","heima");
        redisTemplate.boundValueOps("str").set("heima");
        System.out.println(redisTemplate.opsForValue().get("heima"));
        //hash散列
        redisTemplate.boundHashOps("h_key").put("name","heima");
        redisTemplate.boundHashOps("h_key").put("age",20);
        //获取所有域
        Set set = redisTemplate.boundHashOps("h_key").keys();
        System.out.println("hsah散列的所有域:"+set);
        //获取所有值
        List list = redisTemplate.boundHashOps("h_key").values();
        System.out.println("hsah散列的所有值:"+list);

        //列表
        redisTemplate.boundListOps("l_key").leftPush("a");
        redisTemplate.boundListOps("l_key").leftPush("b");
        redisTemplate.boundListOps("l_key").leftPush("c");
        //获取全部元素
        list = redisTemplate.boundListOps("l_key").range(0, -1);
        System.out.println("list列表中所有元素："+list);

        //set
        redisTemplate.boundSetOps("s_key").add("a","b","c");
        //取值
         set = redisTemplate.boundSetOps("s_key").members();
        System.out.println("set列表中所有元素："+set);

        //sorted set 有序集合
        redisTemplate.boundZSetOps("z_key").add("a",30);
        redisTemplate.boundZSetOps("z_key").add("b",20);
        redisTemplate.boundZSetOps("z_key").add("c",10);
        //取值
         set = redisTemplate.boundZSetOps("z_key").range(0, -1);
        System.out.println("zset有序列表中所有元素："+set);
    }
}
```

# 6.项目部署

**目标**：将springBoot项目使用Maven指令打成jar包并进行单元测试

**分析**：

1. 添加打包组件

   **注意不是dependency依赖**

   ```xml
   <build>
       <plugins>
           <!--maven打包组件，打jar包如果不配置该插件，打出来的jar包没有清单文件-->
           <plugin>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-maven-plugin</artifactId>
           </plugin>
       </plugins>
   </build>
   ```

2. 将项目中的资源、配置、依赖包打到一个jar包中

   可以使用Maven的`package`命令进行打包

   有可能会报错`Cannot access wft in offline mode `

   [报错解决方案参考链接](https://www.jianshu.com/p/62500a3f4112)

   原因：intellij IDEA 默认为offline（离线）模式。
   解决：把Work offline的勾除。

   <img src="https://upload-images.jianshu.io/upload_images/1935267-684ee5e845c456ea.png?imageMogr2/auto-orient/strip|imageView2/2/w/1107/format/webp" alt="img" style="zoom:50%;" />

3. 部署：java -jar 包名

# 7.安装springBoot插件

在使用SpringBoot项目的时候都需要创建启动引导类`**Application`； 使用该插件可以快速创建启动引导类`**Application`类内容。

1. `File`->`Settings`->`Plugins`

   点`Browse repositories`，搜索JBLSpringBootAppGen，`install`安装即可，安装完成后，重启IDEA

2. 选中项目右键即可看到JBLSpringBootAppGen插件，然后生成`**Application`和`**Application.yml`