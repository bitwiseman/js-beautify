node('docker-host') {
  stage 'checkout'
  checkout scm

  stage 'setup'

  stage 'build'

  parallel (
    "Python":  {
      sh './build py'
    },
    "Node":  {
      sh './build js'
    }
  )

  stage 'test'
  parallel (
    "Python":  {
      sh './build pytest'
    },
    "Node":  {
      sh './build jstest'
    }
  )

  stage 'deploy'
  
}
