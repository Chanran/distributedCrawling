# 分布式爬虫系统

## 分工

- 蓝灿荣：爬虫，爬虫性能优化
- 龚子荣：分布式，任务分配
- 李泽轩：数据处理，提取有效信息

## 技术

- celery: 任务切割
- flower: 监控
- fabric: 自动化
- scrapy && scrapy-redis: 分布式爬虫框架


## 目录

```
------ DistributedSpider
        ------ docs              项目相关文档
                ------- install  项目安装脚本
        ------ expample          例子
        ------ web               Python Web应用，接收urls
```

## 启动

```
python web/index.py # 启动web应用
cd example
scrapy crawl mycrawler_redis # 启动爬虫
```

打开[web应用](http://localhost:9001/)，输入要爬取的url并提交。


## License

[MIT](./LICENSE)