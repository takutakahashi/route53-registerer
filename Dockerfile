FROM python:3
RUN apt update -y \
  && apt install -y gcc libssl-dev libffi-dev less groff \
  && pip install https://github.com/boto/botocore/archive/v2.tar.gz \
  && pip install https://github.com/aws/aws-cli/archive/v2.tar.gz \
  && apt clean all

WORKDIR /workspace

RUN apt -y install jq
ADD requirements.txt .
RUN pip install -r requirements.txt
ADD lib/ lib/
ADD entrypoint.sh .

ENTRYPOINT ["/workspace/entrypoint.sh"]
