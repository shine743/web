import express from 'express';

const app = express();

// 기본 라우터 (정상 응답)
app.get('/', (req, res) => {
    res.send('Hello, world!');  // status(200)은 기본적으로 필요 없음
});

// 404 에러 처리 라우터 (모든 라우터를 매칭 후, 404 처리)
app.use((req, res) => {
    res.status(404).send('Not Found');
});

// 서버 실행
const PORT = process.env.PORT || 3000;  // 환경 변수로 포트 지정
app.listen(PORT, () => {
    console.log(`Server is listening on port ${PORT}...`);
});
