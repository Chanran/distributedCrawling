# -*- coding: utf-8 -*-

from scrapy.spiders import Rule
from scrapy.linkextractors import LinkExtractor

from scrapy_redis.spiders import RedisCrawlSpider
from example.items import DangdangItem
import scrapy
import urllib
import time
import re
import chardet
class Dangdang(RedisCrawlSpider):
    """Spider that reads urls from redis queue (myspider:start_urls)."""
    name = 'dangdang'
    redis_key = 'dangdang:start_urls'

    # rules = (
    #     # follow all links
    #     Rule(LinkExtractor(), callback='parse_page', follow=True),
    # )
    rules = {   
        # 其他分类
        Rule(LinkExtractor(allow='http://bang.dangdang.com/books/bestsellers/01.00.00.00.00.00-recent30-0-0-1-\d+'),callback='parse_page',follow=True),        
        # 详情页
        # Rule(LinkExtractor(allow='http://product.dangdang.com/\d+.html$',deny='http://detail.dangdang.com/\d+.html$'), callback='parse_content',follow=False),
    }

    def __init__(self, *args, **kwargs):
        # Dynamically define the allowed domains list.
        domain = kwargs.pop('domain', '')
        self.allowed_domains = filter(None, domain.split(','))
        super(Dangdang, self).__init__(*args, **kwargs)

    def parse_page(self, response):
         
        detail_lx = LinkExtractor(allow=('http://product.dangdang.com/\d+.html$'))
        detailurls = detail_lx.extract_links(response)
        for url in detailurls:
            # print url.url
            yield scrapy.Request(url.url,callback=self.parse_detailpage)

        nextFlag = response.xpath('//li[@class="next"]/a/@href')
        if len(nextFlag)>0 :
            nextFlag = nextFlag[0].extract()
        else:
            return
        # print nextFlag
        if 'loadData' in nextFlag:
            url = response.url
            page = re.search("(\d+)",nextFlag).group(1)
            # print page
            nexturl = re.sub(r'recent30-0-0-1-(\d+)','recent30-0-0-1-'+str(int(page)),url)
            # print "Next Url : ", nexturl
            # page =int(curpage)+10
            # url = re.sub('\d+',str(page),response.url)
            # print url
            yield scrapy.Request(nexturl,callback=self.parse_page)

    def parse_detailpage(self,response):
        item = DangdangItem()
        url = response.url
        print url
        name = response.xpath('//div[@class="name_info"]//h1/@title').extract()[0]

        picurl = response.xpath('//img[@id="largePic"]/@src').extract()[0] if len(response.xpath('//img[@id="largePic"]/@src'))>0 else None

        comment = response.xpath('//a[@id="comm_num_down"]/text()')[0].extract() if len(response.xpath('//a[@id="comm_num_down"]/text()'))>0 else 0
        
        tmp = response.xpath('//span[@id="author"]')
        publish_author = tmp.xpath('string(.)').extract()[0] if len(tmp)>0 else ""

        publish_company_temp = response.xpath('//span[@ddt-area="003"]')
        publish_company = publish_company_temp.xpath('string(.)').extract()[0] if len(publish_company_temp)>0 else ""

        publish_time = response.xpath('//span[@class="t1"][3]/text()').extract()[0] if len(publish_company_temp)>0 else response.xpath('//span[@class="t1"][2]/text()').extract()[0]
        
        price_temp = response.xpath('//p[@id="dd-price"]')
        price = price_temp.xpath('string(.)')[0].extract().strip()
        
        # print name
        item['name'] = name
        item['picurl'] = picurl
        item['url'] = response.url
        item['comment'] = comment
        item['publish_author'] = publish_author
        item['publish_time'] = publish_time
        item['publish_company'] = publish_company
        item['price'] = price
        yield item