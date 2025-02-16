# poker lua

lua言語でポーカー

## API
```sh
docker-compose up --build openresty
```

```sh
curl -X POST -H "Content-Type: application/json" -d '{"hand":["S1","S2","S3","S4","S5"]}' http://localhost:8082/api/v1/judge
```

```sh
curl -H "Content-Type: application/json" http://localhost:8080/api/v1/draw
```

## テスト
```sh
docker-compose up --build test
```
