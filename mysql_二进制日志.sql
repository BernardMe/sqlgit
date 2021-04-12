

-- mysql_二进制日志

-- MySQL master 将数据变更写入二进制日志( binary log, 其中记录叫做二进制日志事件binary log events，可以通过 show binlog events 进行查看)

show binlog events;

-- MySQL 拷贝到它的中继日志(relay log)

show relaylog events;

