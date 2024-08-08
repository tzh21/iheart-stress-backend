# 使用官方 Golang 镜像作为构建环境
FROM golang:1.22 as builder

# Go 代理
ENV GOPROXY=https://goproxy.cn,direct

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
ENV APP_NAME=${APP_NAME}

# 构建应用
RUN CGO_ENABLED=0 GOOS=linux go build -o ${APP_NAME} ./cmd

# 应用运行端口
EXPOSE 8080

CMD ["sh", "-c", "./$APP_NAME"]