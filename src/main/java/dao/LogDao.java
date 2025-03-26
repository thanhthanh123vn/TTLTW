package dao;

import object.LogEntry;

import java.util.List;

public interface LogDao {


        int add(LogEntry log);

        List<LogEntry> findAll();



}
