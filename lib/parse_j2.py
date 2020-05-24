from jinja2 import Environment, FileSystemLoader
import sys
 
env = Environment(loader=FileSystemLoader('.'))
template = env.get_template('lib/route53.json.j2')
 
data = {
        "record": sys.argv[1],
        "address": sys.argv[2]
        }
disp_text = template.render(data)
print(disp_text)
