# 指定依赖镜像版本，基于什么镜像，构建镜像，复制了这个镜像
FROM node:16-alpine

WORKDIR /app
COPY ./ /app  # 也可以使用 ADD，但是COPY更好用，支持url

RUN npm install
RUN npm run build:prod
# 暴露镜像的指定端口，替换成应用实际的端口号
EXPOSE 4000

CMD npm run serve
