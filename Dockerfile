FROM amazon/aws-cli

WORKDIR /workspace

RUN yum -y install jq python-pip
ADD requirements.txt .
RUN pip install -r requirements.txt
ADD lib/ lib/
ADD entrypoint.sh .

ENTRYPOINT ["/workspace/entrypoint.sh"]
