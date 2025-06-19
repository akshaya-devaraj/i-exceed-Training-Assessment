const express=require('express');
const mysql=require('mysql2');
const app=express();

app.use(express.json());

const conn=mysql.createConnection({
       host:"localhost",
       user:'root',
       password:'Password123#@!',
       database:'student'
});

conn.connect((err)=>{
    if(err)
    {
         console.log("No connection established");
    }
    else{
        console.log("connected");
    }
});

app.post("/post",(req,res)=>{

    const id=req.body.id;
    const name=req.body.name;
    const age=req.body.age;
    const city=req.body.city;
    conn.query("insert into studentdata values(?,?,?,?)",[id,name,age,city],(err,result)=>{
        if(err)
        {
            console.log(err);
        }
        else{
            res.send("Inserted into the studentdata");
        }
    });

});

app.get("/get",(req,res)=>{
    conn.query("select * from studentdata",(err,result,field)=>{
        if(err)
        {
            console.log(err);
        }
        else{
            res.send(result);
            console.log(result);
        }
    });
})

app.get("/get/:roll",(req,res)=>{
    
    conn.query("select * from studentdata where roll=?",[req.params.roll],(err,result,field)=>{
        if(err)
        {
            console.log(err);
        }
        else{
            res.send(result);
            console.log(result);
        }
    });
})

app.put("/put/:roll",(req,res)=>{
    conn.query("update studentdata set name=?,age=?,city=? where roll=?",[req.body.name,req.body.age,req.body.city,req.params.roll],(err,result)=>{
       if(err)
       {
         console.log(err);
       }
       else{
        res.send(result);
        console.log("Updated successfully");

       }
    })
})

app.delete("/delete/:roll",(req,res)=>{
    conn.query("delete from studentdata where roll=?",[req.params.roll],(err,result)=>{
        if(err)
        {
            console.log(err);
        }
        else{
            res.send("Deleted Successfully");
           
        }

    })
})



app.listen(5000,(err)=>{
    if(err)
    {
        console.log(err);
    }
    else{
        console.log("listen to the port");
    }
});



