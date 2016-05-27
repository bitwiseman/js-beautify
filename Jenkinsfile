node {
  stage 'checkout'
  checkout scm

  stage 'setup'
  tool 'Docker-1.11.1'

  stage 'build'
  docker.withServer('tcp://192.168.99.100:2376', '') {
    docker.image('python:2.7').inside {
      sh './build full'
    }
  }
}
