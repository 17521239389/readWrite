#!/bin/bash
from=17521239389@163.com
html=/usr/src/a.html
mail -s "$(echo -e "测试\nContent-Type: text/html; charset=utf-8")" $from <$html
