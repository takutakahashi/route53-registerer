from jinja2 import Environment, FileSystemLoader
import sys
import os
 
env = Environment(loader=FileSystemLoader('.'))
template = env.get_template(sys.argv[1])
records = os.environ.get("RECORD_NAME").split(",")
domain = os.environ.get("BASE_DOMAIN")
if domain != None:
        records = list(map(lambda x: x+'.'+domain, records))
data = {
        "records": records,
        "type": os.environ.get("TYPE"),
        "val": os.environ.get("VAL"),
        "hosted_zone_id": os.environ.get("HOSTED_ZONE_ID")
        }
disp_text = template.render(data)
print(disp_text)
