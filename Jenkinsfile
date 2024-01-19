node {
    checkout scm
    docker.image('mysql:latest').withRun('-e "MYSQL_ROOT_PASSWORD=password"' +
                                           ' -p 3306:3306') { c ->
        /* Wait until mysql service is up */
        sh 'while ! mysqladmin ping -h0.0.0.0 --silent; do sleep 1; done'
        /* Run some tests which require MySQL */
        sh 'make check'
        sh 'echo Success'
    }
}