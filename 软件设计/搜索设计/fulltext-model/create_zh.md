### 1. 确保 `pg_trgm` 扩展已安装

首先，你需要确保 `pg_trgm` 扩展已经安装并启用。在 PostgreSQL 数据库中运行以下 SQL 语句：

```sql
CREATE EXTENSION IF NOT EXISTS pg_trgm;
```

### 2. 创建表并设置索引

如果 `pg_trgm` 扩展已启用，那么你可以按照以下步骤重新创建表并设置索引：

```sql
sql复制代码-- 创建表
CREATE TABLE content (
    id SERIAL PRIMARY KEY,
    text TEXT
);

-- 创建 GIN 索引
CREATE INDEX gin_trgm_idx ON content USING GIN (text gin_trgm_ops);
```