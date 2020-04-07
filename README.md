1. Cài đặt

-----
### git clone
```
git clone https://github.com/am6539/docker-jira7
```

### build image
```
docker build . -t="coder965/jira-7"
```

### docker-compose

```
sudo docker-compose up -d
```
-----

2. Khi cài xong vào ip:3080 để setup Jira. Config DB theo:

    -p 5433:5432 
    -e 'POSTGRES_USER=jiradb' 
    -e 'POSTGRES_PASSWORD=pswd4jira' 
    -e 'POSTGRES_DB=jira' 

-----

3. Lấy key trial cho Jira sever như bình thường

-----
4. Setup xong vào Setting Application thấy Expired 2033 là thành công
