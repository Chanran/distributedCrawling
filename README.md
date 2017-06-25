# 分布式爬虫系统

## 分工

- 蓝灿荣：爬虫，爬虫性能优化
- 龚子荣：分布式，任务分配
- 李泽轩：数据处理，提取有效信息

## 技术

- python bottle web框架
- scrapy && scrapy-redis: 分布式爬虫框架
- mysql

## 目录

```
------ DistributedSpider
        ------ config            项目配置文档
        ------ docs              项目相关文档
                ------- install  项目安装脚本
        ------ expample          例子
        ------ web               Python Web应用，接收urls
```

## 部署

> 根据[部署的文档](./docs/README.md)安装多台ubuntu16.04 server lts，用docs/install文件夹下的shell脚本进行自动化安装。不同用途的server要执行不同的shell文件。slave可以有多台。

> **[请看config/README.md完成分布式配置](./config/README.md)**。

> 将example文件夹下面的settings.py里的redis host和port修改成现有的环境依赖。

## 启动

1. database server:
    
    ```
    service mysql start         # 启动mysql
    redis-server                # 启动redis server
    ```

2. slave1,slave2 ... slaveN:


    > **必须修改各slave下路径为/web/python/distributedCrawling/config/conf.ini文件对应的配置**
    
    ```
    cd /web/python/distributedCrawling/example
    scrapy crawl mycrawler_redis    # myscrawler_redis改成要启动的爬虫
    ```

3. master

    > **必须修改各slave下路径为/web/python/distributedCrawling/config/conf.ini文件对应的配置**
    
    ```
    cd /web/python/web
    python index.py                 # 启动web应用
    cd /web/python/distributedCrawling/example
    scrapy crawl mycrawler_redis    # myscrawler_redis改成要启动的爬虫
    ```

4. 打开[web应用](http://localhost:9001/)(localhost修改为master的ip或者域名)，输入要爬取的url并提交。


## License

[MIT](./LICENSE)
