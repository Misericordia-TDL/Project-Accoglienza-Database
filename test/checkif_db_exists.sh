#!/bin/bash
# Function to check if  a database exists
# Syntax: checkif_db_exists db_name
function checkif_db_exists {
        local js="      var found=new Boolean(false);
                        var dbs = db.getMongo().getDBNames(); 
                        for(var i in dbs) {
                                if (dbs[i].toString() == '"${1}"') 
                                        found = 1;
                        }
                        if (found.valueOf()) print(true); else print(false);
                        "
        if [ $(mongo --eval "$js" --quiet) == "false" ]; then
             echo "Database  $1  doesn't exist!"
	else
		echo "Database  $1  found!"
        fi
	
}

checkif_db_exists misericordia 

