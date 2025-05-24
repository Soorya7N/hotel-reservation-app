package com.maharajas.hotel.service.impl;

import com.maharajas.hotel.model.DatabaseSequences;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.FindAndModifyOptions;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

@Service
public class SequenceGeneratorService {
    @Autowired
    MongoOperations mongoOperations;

    public long generateSequence(String seqName) {
        DatabaseSequences counter = mongoOperations.findAndModify(
                Query.query(Criteria.where("_id").is(seqName)),
                new Update().inc("seq", 1),
                FindAndModifyOptions.options().returnNew(true).upsert(true),
                DatabaseSequences.class);
        return counter != null ? counter.getSeq() : 1;
    }
}
