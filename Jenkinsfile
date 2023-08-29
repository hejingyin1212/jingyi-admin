pipeline {
  agent {
      docker { image 'node:7-alpine' }
  }
  environment {
      NAME = 'jingyi-admin'
      APP = 'ly1212/jingyi-admin:dev'
      credentialsId = '366c8e0b-8710-4032-bd77-d5f533f4e1a2'
  }

  stages {
      stage('下载代码') {
          steps {
               echo '****************************** download code start... ******************************'
               git branch: '$branch', credentialsId: '$credentialsId', url: '$gitUrl'
          }
      }

      stage('构建Docker镜像') {
          steps {
               echo '****************************** delete container and image... ******************************'
               sh 'docker ps -a|grep $NAME|awk \'{print $1}\'|xargs -i docker stop {}|xargs -i docker rm {}'
               sh 'docker images|grep $NAME|grep dev|awk \'{print $3}\'|xargs -i docker rmi {}'

               echo '****************************** build image... ******************************'
               sh 'docker build -t $APP .'
          }
      }

      stage('运行容器') {
          steps {
               echo '****************************** run start... ******************************'
               sh 'docker run -d -p 20000:4000 --restart=always --name $NAME $APP'
          }
      }
  }
}
