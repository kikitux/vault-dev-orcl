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

# on Vault node

## connect to vault node

```
vagrant ssh vault
```

## connect to database

```
source /vagrant/sw/instantclient.env 
sqlplus system/password@//db.test:1521/XE
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
