node() {
  stage 'checkout'
  checkout scm

  stage 'setup'

  stage 'build'
  sh '''#!/usr/bin/env bash
  ./build'''

  parallel (
    "Python":  {
      sh '''#!/usr/bin/env bash
      ./build py'''
    },
    "Node":  {
      sh '''./build js'''
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
