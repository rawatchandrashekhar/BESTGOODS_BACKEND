var express=require('express')
var router=express.Router()
var pool=require('./pool')
var upload=require('./multer')

router.post('/testingsubmit',function(req,res){
    try{
        console.log(req.body)
        console.log(req.file)
      pool.query("insert into testing(categoryname,subcategoryname) values(?,?)",[req.body.categoryname,req.body.subcategoryname],function(error,result){
         if(error){
             console.log(error)
             res.status(500).json({result:false})
         }else{
            res.status(200).json({result:true})
         }       
      })
    }catch(e){
        console.log("Error : ",e)
        res.status(500).json({result:false})
    }
})

module.exports=router

