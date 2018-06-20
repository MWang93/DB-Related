#test
db.employees.aggregate(
  [{
      "$match": {
        "hire_date": {
          "$gte": ISODate("2017-01-01T08:00:00.000+08:00")
        }
      }
    },
    {
      "$project": {
        "fullname": {
          "$concat": [
            "$first_name",
            " ",
            "$last_name"
          ]
        },
        "hiredate": {
          "$dateToString": {
            "format": "%Y-%m-%d",
            "date": "$hire_date"
          }
        }
      }
    }
  ])
