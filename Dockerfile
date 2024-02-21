# 파이썬 버젼 지정
FROM python:3.12
# 관리자? 지정
LABEL maintainer = 'meoyong'
# 파이썬이 실행될때 버퍼링을 활성화하는 환경변수 지정
ENV PYTHONBUFFERED 1
# 파일, 폴더를 도커 내로 복사
COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app

# /app 경로에서 실행
WORKDIR /app 
# 8000 포트 지정
EXPOSE 8000
# DEV 개발환경에서 실행여부
ARG DEV=false
# 실행 시킬 스크립트?코드
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [$DEV = "true"] ; \
        then echo "===THIS IS DEVELOPMENT BUILD===" && \
        /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user
# 환경변수
ENV PATH="/py/bin/:$PATH"
# 유저생성
USER django-user