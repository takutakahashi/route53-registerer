FROM amazon/aws-cli

WORKDIR /workspace

RUN yum -y install jq
ADD lib/ lib/
ADD entrypoint.sh .

ENTRYPOINT ["/workspace/entrypoint.sh"]
