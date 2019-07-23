FROM python:3.6.6

ENV PYTHONDONTWRITEBYTECODE 1
ENV WORK_DIR="/app"
ENV USER=app
ENV GROUP=appgroup

RUN mkdir -p ${WORK_DIR}
WORKDIR ${WORK_DIR}
ADD . ${WORK_DIR}

RUN apt update && \
    apt -y install zbar-tools
RUN pip install --upgrade pip &&\
    pip install -r requirements.txt

RUN addgroup --system ${GROUP} &&\
    adduser --system --home --ingroup ${GROUP} ${USER} --shell /bin/bash &&\
    chown -R ${USER}:${GROUP} ${WORK_DIR}

USER ${USER}

ENTRYPOINT ["/app/docker-entrypoint.sh"]

CMD ["run"]
