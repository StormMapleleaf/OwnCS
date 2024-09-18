要在 PostgreSQL 中创建一个支持 Fulltext 搜索的表，首先你需要定义文本字段并使用 `tsvector` 来存储全文索引数据。你可以按照以下步骤来创建一个支持 Fulltext 搜索的表。

### 1. 创建基础的 PostgreSQL 表

首先，创建一个带有 `title` 和 `content` 字段的表，并为 Fulltext 搜索预留一个 `tsvector` 类型的字段，用于存储文本的索引。

```sql
CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    content TEXT,
    search_vector tsvector
);
```

### 2. 创建 `tsvector` 字段并自动更新

为了在插入或更新时自动生成 `tsvector`，你可以创建一个触发器函数。这个函数会将 `title` 和 `content` 字段的内容组合成一个 `tsvector`，并存入 `search_vector` 字段中。

```sql
sql复制代码CREATE OR REPLACE FUNCTION update_search_vector() RETURNS trigger AS $$
BEGIN
    -- 将 title 和 content 合并，并生成 tsvector
    NEW.search_vector := to_tsvector('english', NEW.title || ' ' || NEW.content);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
```

### 3. 创建触发器

接下来，创建触发器，以便在每次插入或更新记录时自动调用上面定义的函数，更新 `search_vector` 字段。

```sql
CREATE TRIGGER update_search_trigger
BEFORE INSERT OR UPDATE ON articles
FOR EACH ROW EXECUTE FUNCTION update_search_vector();
```

### 4. 创建全文索引以提高查询性能

为 `search_vector` 字段创建一个 `GIN` 索引，以便在执行 Fulltext 搜索时提升查询性能：

```sql
CREATE INDEX search_idx ON articles USING GIN(search_vector);
```

### 5. 插入一些测试数据

插入一些示例数据来测试 Fulltext 搜索：

```sql
INSERT INTO articles (title, content) 
VALUES 
('PostgreSQL Fulltext Search', 'Learn how to use Fulltext search in PostgreSQL with PHP.'),
('Docker for Development', 'Setup a development environment using Docker and PostgreSQL.'),
('PHP and PostgreSQL', 'Build a web application using PHP and PostgreSQL integration.');
```

### 6. 进行 Fulltext 搜索查询

你现在可以使用 `to_tsquery` 进行全文搜索查询。以下是一个简单的查询示例，查找包含特定关键词的文章：

```sql
sql复制代码SELECT * FROM articles
WHERE search_vector @@ to_tsquery('docker');
```