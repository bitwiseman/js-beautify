node {
  stage 'checkout'
  checkout scm

  stage 'setup'
  //tool 'Docker-1.11.1'
  sh 'curl -sSL -O https://get.docker.com/builds/Linux/x86_64/docker-1.11.1.tgz && sudo tar zxf docker-1.11.1.tgz -C'

  stage 'build'
  docker.withServer('tcp://192.168.99.100:2376', '') {
    docker.image('python:2.7').inside {
      sh './build full'
    }
  }
}
