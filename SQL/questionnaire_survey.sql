# CREATED BY SHINCHVEN 3/26/2015
# 这是一个MySQ的问卷调查demo
# 1 35行以前是建表。
# 2 35行往后170多行是插入测试数据请无视。
# 3 最后30多行是demo 请从第一题做起。自己查询来领悟结果。

-- 解开下面一行为创建数据库
CREATE DATABASE QS_playground;
use QS_playground; -- 使用Q数据库

-- 清理数据 先删关系 再删主键内容
DROP TABLE qa_relation;
DROP TABLE answer;
DROP TABLE question;

CREATE TABLE question -- 创建问题表
(
  qid INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- 主键 自增
  qtitle VARCHAR(255) CHARACTER SET GBK NOT NULL -- 问题标题，gbk 中文编码
);

CREATE TABLE answer -- 答案表
(
  aid INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- 主键
  acontent VARCHAR(255) CHARACTER SET GBK NOT NULL, -- 答案内容
  qid INT NOT NULL,  -- 归属问题的id
  ascore INT DEFAULT 100, -- 答案分数
  FOREIGN KEY (qid) REFERENCES question (qid)  -- 问题id的外建关联
);
CREATE INDEX qid_idx ON answer (qid); -- 索引，可以无视，会自动建

CREATE TABLE qa_relation -- 关系表
(
  qa_r_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  -- 关系主键
  aid INT NOT NULL,  -- 关系成员 之 回答
  qid INT NOT NULL,  -- 关系成员 之 问题
  FOREIGN KEY (aid) REFERENCES answer (aid), -- 外键关系
  FOREIGN KEY (qid) REFERENCES question (qid) -- 外键关系
);
CREATE INDEX aid_idx ON qa_relation (aid);
CREATE INDEX qid_idx ON qa_relation (qid);


-- 以下是纯数据倒入，请无视。
-- 写入问题数据
INSERT INTO question VALUES (null,'问题01');
INSERT INTO question VALUES (null,'问题02');
INSERT INTO question VALUES (null,'问题03');
INSERT INTO question VALUES (null,'问题04');
INSERT INTO question VALUES (null,'问题05');
INSERT INTO question VALUES (null,'问题06');
INSERT INTO question VALUES (null,'问题07');
INSERT INTO question VALUES (null,'问题08');
INSERT INTO question VALUES (null,'问题09');
INSERT INTO question VALUES (null,'问题10');
INSERT INTO question VALUES (null,'问题11');
INSERT INTO question VALUES (null,'问题12');
INSERT INTO question VALUES (null,'问题13');
INSERT INTO question VALUES (null,'问题14');
INSERT INTO question VALUES (null,'问题15');
INSERT INTO question VALUES (null,'问题16');
INSERT INTO question VALUES (null,'问题17');

-- 写入答案数据 第1题的答案1
INSERT INTO answer VALUES (null,'答案1－1',1,null); -- 1
-- 写入关系 答案1－1 可以引出的其它问题（qid)
INSERT INTO qa_relation VALUES (NULL,1,3); -- a 对应此答案  q 是可扩展的问题
INSERT INTO qa_relation VALUES (NULL,1,2);
INSERT INTO qa_relation VALUES (NULL,1,6);
INSERT INTO qa_relation VALUES (NULL,1,9);
INSERT INTO qa_relation VALUES (NULL,1,12);

-- 写入答案数据
INSERT INTO answer VALUES (null,'答案1－2',1,null); -- 2
-- 写入关系
INSERT INTO qa_relation VALUES (NULL,2,4);
INSERT INTO qa_relation VALUES (NULL,2,6);
INSERT INTO qa_relation VALUES (NULL,2,7);
INSERT INTO qa_relation VALUES (NULL,2,8);
INSERT INTO qa_relation VALUES (NULL,2,14);

-- 写入答案数据
INSERT INTO answer VALUES (null,'答案1－3',1,null); -- 3
-- 写入关系
INSERT INTO qa_relation VALUES (NULL,3,3);
INSERT INTO qa_relation VALUES (NULL,3,2);
INSERT INTO qa_relation VALUES (NULL,3,4);
INSERT INTO qa_relation VALUES (NULL,3,9);
INSERT INTO qa_relation VALUES (NULL,3,12);

-- 写入答案数据
INSERT INTO answer VALUES (null,'答案2－1',2,null); -- 4
-- 写入关系
INSERT INTO qa_relation VALUES (NULL,4,5); -- a 对应此答案  q 是可扩展的问题
INSERT INTO qa_relation VALUES (NULL,4,4);
INSERT INTO qa_relation VALUES (NULL,4,7);
INSERT INTO qa_relation VALUES (NULL,4,14);
INSERT INTO qa_relation VALUES (NULL,4,12);

-- 写入答案数据
INSERT INTO answer VALUES (null,'答案2－2',2,null); -- 5
-- 写入关系
INSERT INTO qa_relation VALUES (NULL,5,14);
INSERT INTO qa_relation VALUES (NULL,5,16);
INSERT INTO qa_relation VALUES (NULL,5,4);
INSERT INTO qa_relation VALUES (NULL,5,10);
INSERT INTO qa_relation VALUES (NULL,5,9);

-- 写入答案数据
INSERT INTO answer VALUES (null,'答案2－3',2,null); -- 6
-- 写入关系
INSERT INTO qa_relation VALUES (NULL,6,3);
INSERT INTO qa_relation VALUES (NULL,6,6);
INSERT INTO qa_relation VALUES (NULL,6,11);
INSERT INTO qa_relation VALUES (NULL,6,4);
INSERT INTO qa_relation VALUES (NULL,6,12);

-- 写入答案数据
INSERT INTO answer VALUES (null,'答案3－1',3,null); -- 7
-- 写入关系
INSERT INTO qa_relation VALUES (NULL,7,5); -- a 对应此答案  q 是可扩展的问题
INSERT INTO qa_relation VALUES (NULL,7,4);
INSERT INTO qa_relation VALUES (NULL,7,7);
INSERT INTO qa_relation VALUES (NULL,7,14);
INSERT INTO qa_relation VALUES (NULL,7,12);

-- 写入答案数据
INSERT INTO answer VALUES (null,'答案3－2',3,null); -- 8
-- 写入关系
INSERT INTO qa_relation VALUES (NULL,8,14);
INSERT INTO qa_relation VALUES (NULL,8,16);
INSERT INTO qa_relation VALUES (NULL,8,4);
INSERT INTO qa_relation VALUES (NULL,8,10);
INSERT INTO qa_relation VALUES (NULL,8,9);

-- 写入答案数据
INSERT INTO answer VALUES (null,'答案3－3',3,null); -- 9
-- 写入关系
INSERT INTO qa_relation VALUES (NULL,9,3);
INSERT INTO qa_relation VALUES (NULL,9,6);
INSERT INTO qa_relation VALUES (NULL,9,11);
INSERT INTO qa_relation VALUES (NULL,9,4);
INSERT INTO qa_relation VALUES (NULL,9,12);

-- 写入答案数据
INSERT INTO answer VALUES (null,'答案4－1',4,null); -- 10
-- 写入关系
INSERT INTO qa_relation VALUES (NULL,10,5); -- a 对应此答案  q 是可扩展的问题
INSERT INTO qa_relation VALUES (NULL,10,4);
INSERT INTO qa_relation VALUES (NULL,10,7);
INSERT INTO qa_relation VALUES (NULL,10,14);
INSERT INTO qa_relation VALUES (NULL,10,12);

-- 写入答案数据
INSERT INTO answer VALUES (null,'答案4－2',4,null); -- 11
-- 写入关系
INSERT INTO qa_relation VALUES (NULL,11,14);
INSERT INTO qa_relation VALUES (NULL,11,16);
INSERT INTO qa_relation VALUES (NULL,11,4);
INSERT INTO qa_relation VALUES (NULL,11,10);
INSERT INTO qa_relation VALUES (NULL,11,9);

-- 写入答案数据
INSERT INTO answer VALUES (null,'答案4－3',4,null); -- 12
-- 写入关系
INSERT INTO qa_relation VALUES (NULL,12,3);
INSERT INTO qa_relation VALUES (NULL,12,6);
INSERT INTO qa_relation VALUES (NULL,12,11);
INSERT INTO qa_relation VALUES (NULL,12,4);
INSERT INTO qa_relation VALUES (NULL,12,12);

-- 写入答案数据
INSERT INTO answer VALUES (null,'答案5－1',5,null); -- 13
-- 写入关系
INSERT INTO qa_relation VALUES (NULL,13,5); -- a 对应此答案  q 是可扩展的问题
INSERT INTO qa_relation VALUES (NULL,13,4);
INSERT INTO qa_relation VALUES (NULL,13,7);
INSERT INTO qa_relation VALUES (NULL,13,14);
INSERT INTO qa_relation VALUES (NULL,13,12);

-- 写入答案数据
INSERT INTO answer VALUES (null,'答案5－2',5,null); -- 14
-- 写入关系
INSERT INTO qa_relation VALUES (NULL,14,14);
INSERT INTO qa_relation VALUES (NULL,14,16);
INSERT INTO qa_relation VALUES (NULL,14,4);
INSERT INTO qa_relation VALUES (NULL,14,10);
INSERT INTO qa_relation VALUES (NULL,14,9);

-- 写入答案数据
INSERT INTO answer VALUES (null,'答案5－3',5,null); -- 15
-- 写入关系
INSERT INTO qa_relation VALUES (NULL,15,3);
INSERT INTO qa_relation VALUES (NULL,15,6);
INSERT INTO qa_relation VALUES (NULL,15,11);
INSERT INTO qa_relation VALUES (NULL,15,4);
INSERT INTO qa_relation VALUES (NULL,15,12);

INSERT INTO answer VALUES (null,'答案6－1',6,null);
INSERT INTO answer VALUES (null,'答案6－2',6,null);
INSERT INTO answer VALUES (null,'答案6－3',6,null);
INSERT INTO answer VALUES (null,'答案7－1',7,null);
INSERT INTO answer VALUES (null,'答案7－2',7,null);
INSERT INTO answer VALUES (null,'答案7－3',7,null);
INSERT INTO answer VALUES (null,'答案8－1',8,null);
INSERT INTO answer VALUES (null,'答案8－2',8,null);
INSERT INTO answer VALUES (null,'答案8－3',8,null);
INSERT INTO answer VALUES (null,'答案9－1',9,null);
INSERT INTO answer VALUES (null,'答案9－2',9,null);
INSERT INTO answer VALUES (null,'答案9－3',9,null);
INSERT INTO answer VALUES (null,'答案10－1',10,null);
INSERT INTO answer VALUES (null,'答案10－2',10,null);
INSERT INTO answer VALUES (null,'答案10－3',10,null);






-- 以下是数据查看
SELECT * FROM answer;
SELECT * FROM question;
SELECT * FROM qa_relation;

-- 现在开始运行做题，请一步一步的查询 查看结果

-- 做第一题
SELECT * FROM answer WHERE qid=1; -- 查询第一题可选的答案
-- 答案编号 （1、2、3）
SELECT * FROM qa_relation WHERE aid=1; -- 查询编号1（第1题第1个答案）的答案
-- 获得 3、2、6、9、12 这些题目的qid 此时场上有 1、3､2､6､9､12
-- 做第二题（编号3） 先查询这一题的答案
SELECT * from answer where qid = 3; -- 获取第三题的答案集
-- 得到与之关联的答案 3－1（编号7） 3－8（编号8） 3－9（编号9）
SELECT * FROM qa_relation WHERE aid=8; -- 选择第3个答案（编号8）获得与之关联的答案
-- 肉眼可见 14、16､4､10､9
-- 其中9是重复的 我们需要得到的是 14、16､14､10应该这样查询
SELECT qid FROM qa_relation WHERE aid=8 AND qid NOT IN (1,3,2,6,9,12);
-- 肉眼获得 14＼16＼4＼10
-- 下面是完结式 场上已经有该题所关联的所有题了
SELECT qid FROM qa_relation WHERE aid=8 AND qid NOT IN (9,14,16,4,10);
-- 得到0行数据

-- 详解查询条件
SELECT qid FROM qa_relation -- 从qa_relation 中查询qid 这一个列数据 
WHERE aid=8 -- 首先它是跟8绑定的
      AND qid NOT IN (9,14,16,4,10); -- 但这些已经出现在场上









