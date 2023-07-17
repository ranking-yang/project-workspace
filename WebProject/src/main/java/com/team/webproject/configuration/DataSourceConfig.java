package com.team.webproject.configuration;

//옮겨서 사용하시면 됩니다
//한번 읽어보시면 이해되실거예요(root-context.xml 생각하면됨)
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

//이 클래스는 설정 파일임을 명시하는 어노테이션
@Configuration 
//.properties 파일에 정의한 내용을 가지고 오기 위한 어노테이션
@PropertySource("classpath:/application.properties")
//mapper interface경로 지정(sqlSession객체하고의 연동을 위해 지정해야한다)
@MapperScan(value = "com.team.webproject.mapper")
public class DataSourceConfig {

	@Autowired
	ApplicationContext applicationContext;

	@Bean // bean설정을 통해 의존성 주입이 가능해진다
	@ConfigurationProperties(prefix = "spring.datasource.hikari")// properties파일에서 정의한 속성적용을 위한 어노테이션
	public HikariConfig hikariConfig() {
		return new HikariConfig();
	}

	@Bean
	public DataSource dataSource() {
		return new HikariDataSource(hikariConfig());
	}

	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();

		// 접속할 db정보를 초기화한다
		sessionFactory.setDataSource(dataSource);
		// db에서 행해질 sql구문을 초기화한다
		sessionFactory.setMapperLocations(applicationContext.getResources("classpath:/mapper/**/*.xml"));
		// xml에서 resultType에 사용될 dto클래스의 패키지명을 정의함으로써 클래스명만 사용해도되게 설정한다
		// ex) resultType="com.team.webproject.dto.Prize" -> resultType="Prize"
		sessionFactory.setTypeAliasesPackage("com.team.webproject.dto");
		
		return sessionFactory.getObject();
	}

	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) throws Exception {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
}