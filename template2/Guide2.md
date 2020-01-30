
# Template 2

## What's in the template

- Frontend of the mini-portal

- A Student list page which will fetch the list of students from the databases and display in the frontend

- "Add new student" functionality

## Prerequisite

Create the `student` Table

```

CREATE TABLE student (

id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,

firstname VARCHAR(30) NOT NULL,

lastname VARCHAR(30) NOT NULL,

email VARCHAR(50),

netid VARCHAR(50)

);

```

Insert some mocking data

```

INSERT INTO student (firstname , lastname , email , netid)

VALUES ("Eric","TEST","TEST@TEST.com","tt1");

INSERT INTO student (firstname , lastname , email , netid)

VALUES ("David","TEST","TEST@TEST.com","tt2");

INSERT INTO student (firstname , lastname , email , netid)

VALUES ("Alice","TEST","TEST@TEST.com","tt3");

INSERT INTO student (firstname , lastname , email , netid)

VALUES ("Bob","TEST","TEST@TEST.com","tt4");

INSERT INTO student (firstname , lastname , email , netid)

VALUES ("Cell","TEST","TEST@TEST.com","tt5");

INSERT INTO student (firstname , lastname , email , netid)

VALUES ("Rub","TEST","TEST@TEST.com","tt6");

```

## Run

```

cd template2

mvn clean

mvn tomcat:run

```
![Captur1e.PNG](https://i.loli.net/2020/01/29/7gbnpDmu43RTeh6.png)
![Cap2ture.PNG](https://i.loli.net/2020/01/29/3bIiqW5HvdcwnTD.png)

Author: Enkai Ji
