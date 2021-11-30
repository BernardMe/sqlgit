



-- 更改表结构_代理商信息
alter table cls_market_etc_agent
	add total_active_bonus decimal(10,2) default 0.00 null comment '累计激活奖励金额(元)';

alter table cls_market_etc_agent
	add total_first_consume_bonus decimal(10,2) default 0.00 null comment '累计首次消费奖励金额(元)';

alter table cls_market_etc_agent
	add total_withdraw_amount decimal(10,2) default 0.00 null comment '累计激活奖励金额(元)';



-- 更改表结构_ETC商品信息表
alter table cls_market_etc_goods drop column price;

