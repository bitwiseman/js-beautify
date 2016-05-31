node('docker-host') {
  stage 'checkout'
  checkout scm

  stage 'setup'
  //tool 'Docker-1.11.1'
  //sh 'curl -sSL -O https://get.docker.com/builds/Linux/x86_64/docker-1.11.1.tgz && tar zxf docker-1.11.1.tgz -C /'

  stage 'build'
  parallel (
    "Python":  {
      sh './build py'
    },
    "Node":  {
      sh './build js'
    }
  )
  // docker.withServer('tcp://192.168.99.100:32787', '') {
    //docker.image('python:2.7').inside {
      //checkout scm
    //}
  // }
}
