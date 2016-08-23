node() {
  stage 'checkout'
  checkout scm

  stage 'setup'

  stage 'build'
  sh '''#!/usr/bin/env bash --
  env
  ./build py'''
  sh '''#!/usr/bin/env bash --
  env
  ./build js'''

//   parallel (
//     "Python":  {
//       sh '''#!/usr/bin/env bash
//       ./build py'''
//     },
//     "Node":  {
//       sh '''./build js'''
//     }
//   )

  stage 'test'
  sh '''#!/usr/bin/env bash -l
  env
  set +e
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
