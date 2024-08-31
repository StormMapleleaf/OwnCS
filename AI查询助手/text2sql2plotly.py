

# 提前导入各种库

from langchain_community.utilities import SQLDatabase
from langchain_core.prompts import ChatPromptTemplate
from langchain_community.chat_models import ChatOllama
from langchain_core.output_parsers import StrOutputParser
from langchain_core.runnables import RunnablePassthrough
from decimal import Decimal
import plotly.graph_objects as go
import plotly
import pkg_resources
import matplotlib
import pandas

#获取所有的已安装的pip包

def get_piplist(p):
    return [d.project_name for d in pkg_resources.working_set]


# 使用库根据sql语句读取数据
import mysql.connector
# MySQL 配置
# 数据库相关参数设置，包含用户名、密码等
db_user = "root"                    #位于 《设置数据库密码与配置信息》中 （青色矩形框）
db_password = "admin123.."       #位于 《设置数据库密码与配置信息》中 （青色矩形框）
db_host = "sh-cynosdbmysql-grp-6de6gexo.sql.tencentcdb.com"           #位于 《登录在线管理工具图片》中（青色矩形框）
db_port='24621'             #位于 《登录在线管理工具图片》中（青色矩形框）
db_name = "shop"

# 获得schema
def get_schema(db):
    
    schema = mysql_db.get_table_info()
    return schema


# 通过api获取llm
#ollama = ChatOllama(model="llama3.1:latest")#本地ollama
ollama = ChatOllama(model="llama3.1:8b",base_url="http://192.144.228.147:6399")# 将此处的xxx 更换为自己远程hai算力服务器的ip地址  位于《打开hai算力服务器的ollama对外端口，允许外部链接》 中  （青色矩形框）

#获取操作结果的方法
def getResult(content):
    global mysql_db
    # 数据库连接
    mysql_db = SQLDatabase.from_uri(f"mysql+mysqlconnector://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}")
    # 获得 数据库中表的信息
    #mysql_db_schema = mysql_db.get_table_info()
    #print(mysql_db_schema)
    template = """基于下面提供的数据库schema, 根据用户提供的要求编写sql查询语句,要求尽量使用最优sql,每次查询都是独立的问题，不要收到其他查询的干扰:
    {schema}
    Question: {question}
    只返回sql语句，不要任何其他多余的字符，例如markdown的格式字符等:
    如果有异常抛出不要显示出来
    """
    prompt = ChatPromptTemplate.from_template(template)
    text_2_sql_chain = (
                RunnablePassthrough.assign(schema=get_schema)
                | prompt
                | ollama
                | StrOutputParser()
        )
    
    # 执行langchain 获取操作的sql语句
    sql = text_2_sql_chain.invoke({"question": content})

    print(sql)
    #连接数据库进行数据的获取
    # 配置连接信息
    conn = mysql.connector.connect(
    
        host=db_host,
        port=db_port,
        user=db_user,
        password=db_password,
        database=db_name
    )
    # 创建游标对象
    cursor = conn.cursor()
    # 查询数据
    cursor.execute(sql.strip("```").strip("```sql"))
    info = cursor.fetchall()
    # 打印结果
    #for row in info:
        #print(row)
    # 关闭游标和数据库连接
    cursor.close()
    conn.close()
    #根据数据生成对应的图表
    print(info)
    template2 = """
    以下提供当前python环境已经安装的pip包集合:
    {installed_packages};
    请根据data提供的信息，生成是一个适合展示数据的plotly的图表的可执行代码,要求如下：
        1.不要导入没有安装的pip包代码
        2.如果存在多个数据类别，尽量使用柱状图，循环生成时图表中对不同数据请使用不同颜色区分，
        3.图表要生成图片格式,保存在当前文件夹下即可，名称固定为：图表.png,
        4.我需要您生成的代码是没有 Markdown 标记的，纯粹的编程语言代码。
        5.生成的代码请注意将所有依赖包提前导入， 
        6.不要使用iplot等需要特定环境的代码
        7.请注意数据之间是否可以转换，使用正确的代码
        8.不需要生成注释
    data:{data}

    这是查询的sql语句与文本:

    sql:{sql}
    question:{question}
    返回数据要求:
    仅仅返回python代码，不要有额外的字符
    """
    prompt2 = ChatPromptTemplate.from_template(template2)
    data_2_code_chain = (
                RunnablePassthrough.assign(installed_packages=get_piplist)
                | prompt2
                | ollama
                | StrOutputParser()
        )
    
    # 执行langchain 获取操作的sql语句
    code = data_2_code_chain.invoke({"data": info,"sql":sql,'question':content})
    
    #删除数据两端可能存在的markdown格式
    print(code.strip("```").strip("```python"))
    exec(code.strip("```").strip("```python"))
    return {"code":code,"SQL":sql,"Query":info}


# 构建展示页面
import streamlit
# 设置页面标题
streamlit.title('AI查询小助手')
# 设置对话框
content = streamlit.text_area('请输入想查询的信息', value='', max_chars=None)
# 提问按钮 # 设置点击操作
if streamlit.button('提问'):
    #开始ai及langchain操作
    if content:
        #进行结果获取
        result = getResult(content)
        #显示操作结果
        streamlit.write('AI生成的SQL语句:')
        streamlit.write(result['SQL'])
        streamlit.write('SQL语句的查询结果:')
        streamlit.write(result['Query'])
        streamlit.write('plotly图表代码:')
        streamlit.write(result['code'])
        # 显示图表内容（生成在getResult中）
    streamlit.image('./图表.png', width=800) 

#以下为推荐的几个查询操作：
#查询每个用户账号的名称和长度（单表查询）
#查询一下每类商品的名称和对应的销售总额（单表查询）
#查询出用户赵强的已支付订单的总额和未支付订单的总额数据（多表联查）