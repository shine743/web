import express from 'express';

const app = express();

// 기본 라우터 (정상 응답)
app.get('/', (req, res) => {
    res.status(200).send('Hello, world!');
});

// 404 에러 처리 라우터
app.use((req, res) => {
    res.status(404).send('Not Found');
});

// 서버 실행
app.listen(80, () => {
    console.log('Server is listening on port 80...');
});