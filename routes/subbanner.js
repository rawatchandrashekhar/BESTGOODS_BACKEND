var express=require('express')
var router=express.Router()
var pool=require('./pool')
var upload=require('./multer')

// router.post('/subbannersubmittesting',function(req,res){
//     try{
//         console.log(req.body)
//         console.log(req.file)
//       pool.query("insert into subbanners(categoryid,subcategoryid) values(?,?)",[req.body.categoryid,req.body.subcategoryid],function(error,result){
//          if(error){
//              console.log(error)
//              res.status(500).json({result:false})
//          }else{
//             res.status(200).json({result:true,subbannerid:result.insertId})
//          }       
//       })
//     }catch(e){
//         console.log("Error : ",e)
//         res.status(500).json({result:false})
//     }
// })

router.post('/displayallsubbannerbysubcategoryid',function(req,res){
    try{
      pool.query("select * from subbanners where subcategoryid=?",[req.body.subcategoryid],function(error,result){
          if(error){
              res.status(500).json({data:[]})
          }else{
              res.status(200).json({data:result})
          }
      })
   }catch(e){
       console.log("Error : ",e)
       res.status(500).json({result:[]})         
   }
  })


router.post('/subbannersubmit',upload.any(),function(req,res){
    console.log(req.body)
    console.log(req.file)
    try{
        var q="insert into subbanners(categoryid,subcategoryid,images)values ?"
      pool.query(q,[req.files.map((item)=>[req.body.categoryid,req.body.subcategoryid,item.filename])],function(error,result){
         if(error){
             console.log(error)
             res.status(500).json({result:false})
         }else{
            res.status(200).json({result:true,subbannerid:result.insertId})
         }       
      })
    }catch(e){
        console.log("Error : ",e)
        res.status(500).json({result:false})
    }
})

module.exports=router
