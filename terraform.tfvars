region = "ap-southeast-1"

main_vpc_cidr        = "192.168.0.0/24"   # 256 host ip adddresses
public_subnets_cidr  = "192.168.0.0/25"   # 128 host ip addresseses, from 192.168.0.0 to 192.168.0.127
private_subnets_cidr = "192.168.0.128/25" # 128 host ip addresseses, from 192.168.0.128 to 192.168.0.255

db_username = "hdb_aurora_db_user"
db_password = "Testtest-password123"
