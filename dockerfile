# 1. 기본 이미지 선택
FROM httpd:2.4

# 2. 필수 패키지 설치
RUN apt-get update && apt-get install -y python3 python3-pip

# 3. 애플리케이션 코드 복사
COPY ./html/ /usr/local/apache2/htdocs/

# 4. 작업 디렉토리 설정
WORKDIR /app

# 5. 필요한 Python 패키지 설치
RUN pip3 install -r requirements.txt

# 6. 포트 노출
EXPOSE 80
