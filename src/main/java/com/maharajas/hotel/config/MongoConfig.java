package com.maharajas.hotel.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.MongoDatabaseFactory;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.convert.DefaultMongoTypeMapper;
import org.springframework.data.mongodb.core.convert.MappingMongoConverter;
import org.springframework.data.mongodb.core.convert.MongoCustomConversions;
import org.springframework.data.mongodb.core.mapping.MongoMappingContext;

@Configuration
public class MongoConfig {

    @Bean
    public MappingMongoConverter mappingMongoConverter(MongoDatabaseFactory factory,
                                                       MongoMappingContext context,
                                                       MongoCustomConversions conversions) {
        MappingMongoConverter converter = new MappingMongoConverter(factory, context);

        // This removes the _class field from being saved
        converter.setTypeMapper(new DefaultMongoTypeMapper(null));

        return converter;
    }

    @Bean
    public MongoTemplate mongoTemplate(MongoDatabaseFactory mongoDatabaseFactory,
                                       MappingMongoConverter converter) {
        return new MongoTemplate(mongoDatabaseFactory, converter);
    }
}