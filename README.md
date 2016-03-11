== Additional settings ==

Download Oracle Instant Client to your computer and then upload it using scp:

```
scp -P 2222 oracle-instantclient11.2-basic-11.2.0.3.0-1.x86_64.rpm docker@192.168.99.100:/home/docker
```

```
scp -P 2222 oracle-instantclient11.2-devel-11.2.0.3.0-1.x86_64.rpm docker@192.168.99.100:/home/docker
```

Then run:

```
sh install_oracle_instantclient.sh
```
