import sys
import json

separated_domain = sys.argv[1].split(".")

zone = ".".join(separated_domain[1:])

print(json.dumps({"zone": zone, "record": separated_domain[0]}))

