# 使用官方 Golang 镜像作为构建环境
FROM golang:1.22 as builder

# 设置工作目录
WORKDIR /app

# 复制 go 模块和依赖相关的文件
COPY go.mod .
COPY go.sum .

# 下载所有依赖
RUN go mod download

# 复制源代码到容器中
COPY . .

# APP 名称变量
ARG APP_NAME=stress-backend
ENV ENV_APP_NAME=APP_NAME

# 构建应用
RUN CGO_ENABLED=0 GOOS=linux go build -o ${APP_NAME}

# 使用 scratch 作为运行环境
FROM scratch

# 从构建者镜像中复制构建好的应用
COPY --from=builder /app/${APP_NAME} /${APP_NAME}

# 应用运行端口
EXPOSE 8080

# 运行应用
CMD ["bash", "-c", "${ENV_APP_NAME}"]