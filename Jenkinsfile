node {
  checkout scm
  docker.withServer('tcp://192.168.99.100:2376') {
    docker.image('python:2.7').inside {
      sh './build full'
    }
  }
}
