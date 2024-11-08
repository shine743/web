# 1. 기본 이미지 선택 (Node.js)
FROM ubuntu:20.04

User root

# 2. 앱 디렉토리 만들기
WORKDIR /usr/src/app

# 3. 의존성 파일을 복사하여 설치
COPY package*.json ./

# 4. 의존성 설치 (npm 사용 전에 apt-get 최적화)
RUN apt update && apt install -y \
  curl \
  sudo \
  gnupg \
  lsb-release \
  && curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
  && apt install -y nodejs \
  && npm install \
  && rm -rf /var/lib/apt/lists/*  
  # apt cache 청소

# 5. 애플리케이션 소스 코드를 복사
COPY . .

# 6. 일반 사용자 추가 (보안상 권장)
RUN useradd -m -s /bin/bash appuser \
  && chown -R appuser:appuser /usr/src/app

# 7. jenkins 사용자로 실행하려면, 사용자 변경
USER jenkins

# 8. 포트 3000을 개방
EXPOSE 3000

# 9. 애플리케이션 실행
CMD ["npm", "start"]