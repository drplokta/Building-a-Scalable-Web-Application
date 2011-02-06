#Define nodes
node 	"dev1.localdomain" {
    include standard
    include webserver
    include mongodbserver
    include postgresqlserver
    include dev
}


