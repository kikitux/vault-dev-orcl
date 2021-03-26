# vault-dev-orcl
vault repo for oracle db and plugin

## pre-requeriments

- virtualbox
- vagrant
- [oracle db xe](https://www.oracle.com/database/technologies/xe-downloads.html)

Place the binary for 18c xe db in sw directory
```
sw/oracle-database-xe-18c-1.0-1.x86_64.rpm
```

# how to use this repo

- clone this repo
```
git clone https://github.com/kikitux/vault-dev-orcl
```

- change directory
```
cd vault-dev-orcl
```

- place the [oracle db xe](https://www.oracle.com/database/technologies/xe-downloads.html) binary in the `sw/` directory

- create the vms
```
vagrant up
```

# information about database

The following users will be created:

- dynamic
- static
- myuser

# on db node

## connect to database

if there is the need to connect to the database, to perform operations like create users, you can connect like this

```
vault ssh db
sudo su - oracle
. oraenv
XE
export ORACLE_PDB_SID=XEPDB1
sqlplus / as sysdba
```

## restore database

if there is the need to restore database to a good point, you can do

```
vagrant provision --provision-with flashback
```

# on Vault node

## connect to vault node

```
vagrant ssh vault
```

## connect to database

```
source /vagrant/scripts/instantclient.env 
sqlplus system/password@//db.test:1521/XEPDB1
```

## vault status

```
VAULT_ADDR=http://127.0.0.1:8200 vault status
```

sample output

```
VAULT_ADDR=http://127.0.0.1:8200 vault status
Key             Value
---             -----
Seal Type       shamir
Initialized     true
Sealed          false
Total Shares    1
Threshold       1
Version         1.6.3
Storage Type    inmem
Cluster Name    vault-cluster-0ef20ec9
Cluster ID      859a991b-5643-e1bc-b6ee-b6b165fcf6e8
HA Enabled      false
```


## generate credential

```
VAULT_ADDR=http://127.0.0.1:8200 vault read database/creds/my-role
```

# vault ui

## private network

- url 
```
http://192.168.56.51:8100/ui
```

- root token
```
changeme
```
