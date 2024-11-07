# 1. 기본 이미지 선택 (Node.js)
FROM node:16

# 2. 앱 디렉토리 만들기
WORKDIR /usr/src/app

# 3. 의존성 파일을 복사하여 설치
COPY package*.json ./
RUN npm install

# 4. 애플리케이션 소스 코드를 복사
COPY . .

# 5. 포트 80을 개방
EXPOSE 3000

# 6. 애플리케이션 실행
CMD [ "npm", "start" ]