package com.example.sd_36_datn_tung.Service.redis;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface BaseRedisService {

    void set(String key, String value);

    void setTimeToLive(String key,long timeoutInDays);

    void hashSet(String key,String field,Object value);

    boolean hashExists(String key,String field);

    Object get(String key);

    public Map<String,Object> getField(String key);

    Object hashGet(String key,String field);

    List<Object> hashGetByFieldPrefix(String key, String filedFrefix);

    Set<String> getFieldPrefixs(String key);

    void delete(String key);

    void delete(String key, String filed);

    void delete(String key, List<String> fields);

}
