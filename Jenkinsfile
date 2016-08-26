node() {
  stage 'checkout'
  checkout scm

  stage 'setup'

  stage 'build'
  sh '''./build py'''
  sh '''./build js'''

  stage 'test'
  sh '''#!/usr/bin/env bash -l
  env
  set +e
  /Users/bitwiseman/jenkins/agents/osx_mbp/workspace/beautify-pipeline/nightwatch/js/test/../bin/css-beautify.js
  npm run-script jstest
  '''
  sh '''#!/usr/bin/env bash --
  env
  set +e
  ./build pytest'''
//   parallel (
//     "Python":  {
//   },
//     "Node":  {
//       sh './build jstest'
//     }
//   )

  stage 'deploy'

}
