#!/bin/bash
from='17521239389@163.com'
to='13162965225@163.com'
email_date=$(date "+%Y-%m-%d_%H:%M:%S")
email_subject='测试邮件'
email_content='/usr/src/a.html'
echo "测试邮件" | mail -s '测试邮件' -a ${email_content} ${from}
