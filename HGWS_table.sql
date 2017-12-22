
DROP TABLE cs_account;
--创建cs_account 账号表
CREATE TABLE cs_account(
   accid VARCHAR2(30),
   accpwd VARCHAR2(30),
   
   CONSTRAINT pk_cs_account_accid PRIMARY KEY (accid)
);
--添加表注释：
COMMENT ON table cs_account IS '账号表';
--添加字段注释：
comment on column cs_account.accid is '账号';
comment on column cs_account.accpwd is '密码';

DROP TABLE tb_order;
--创建tb_order 订单表
CREATE TABLE tb_order(
   orderno NUMBER(20),
   genetime DATE,
   accid VARCHAR2(30),
   orderstat CHAR(1),
   paid CHAR(1),
   
   CONSTRAINT pk_tb_order_orderno PRIMARY KEY (orderno)
);
--添加表注释：
COMMENT ON table tb_order IS '订单表';
--添加字段注释：
comment on column tb_order.orderno is '订单号';
comment on column tb_order.genetime is '订单生成时间';
comment on column tb_order.accid is '账号';
comment on column tb_order.orderstat is '状态(1正常、2申请取消、3取消中、0已取消)';
comment on column tb_order.paid is '是否已支付';
--添加外键tb_order 订单表
ALTER TABLE tb_order ADD CONSTRAINT fk_tb_order_accid 
FOREIGN KEY (accid) REFERENCES cs_account(accid);

