node('master') {
    def commit_id
    // some block
stage('prepration') {
    // some block
checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/vyom00/nitro2.git']]])
}
stage('test') {
nodejs('nodejs1') {
   sh 'npm install --only=dev'
   sh 'npm test'
}
    
}
 stage('docker build push') {
    // This step should not normally be used in your script. Consult the inline help for details.
    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
        def app = docker.build("vyom00/nitro2:${commit_id}", '.').push()
    }

}   
}
