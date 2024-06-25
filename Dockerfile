FROM public.ecr.aws/lambda/provided:al2023

RUN dnf install -y \
    python3.11 \
    python3.11-pip \
    && dnf clean all

RUN python3.11 -m pip install --upgrade pip
RUN ln -s /usr/bin/python3.11 /usr/bin/python3
RUN ln -s /usr/bin/python3.11 /usr/bin/python
RUN ln -s /usr/bin/pip3.11 /usr/bin/pip3
RUN ln -s /usr/bin/pip3.11 /usr/bin/pip

ENV LANG=en_US.UTF-8
ENV TZ=:/etc/localtime
ENV PATH=/var/lang/bin:/usr/local/bin:/usr/bin/:/bin:/opt/bin
ENV LD_LIBRARY_PATH=/var/lang/lib:/lib64:/usr/lib64:/var/runtime:/var/runtime/lib:/var/task:/var/task/lib:/opt/lib
ENV LAMBDA_TASK_ROOT=/var/task
ENV LAMBDA_RUNTIME_DIR=/var/runtime

WORKDIR /var/task

ENTRYPOINT ["/lambda-entrypoint.sh"]
