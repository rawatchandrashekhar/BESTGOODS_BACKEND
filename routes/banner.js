var express=require('express')
var router=express.Router()
var pool=require('./pool')
var upload=require('./multer')

router.post('/bannersubmit',upload.single('icon'),function(req,res){
    try{
        console.log(req.body)
        console.log(req.file)
      pool.query("insert into banners(priority,description,image) values(?,?,?)",[req.body.priority,req.body.description,req.file.originalname],function(error,result){
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

router.get('/displayallbanner',function(req,res){
  try{
    pool.query("select * from banners",function(error,result){
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

  router.post('/updatebannerdata',function(req,res){
    try{
      pool.query("update banners set description=?,priority=? where bannerid=?",[req.body.description,req.body.priority,req.body.bannerId],function(error,result){
      console.log(error)
      console.log(result)
        if(error)
        {
          res.status(500).json({result:false})
        }
        else{
          res.status(200).json({result:true})
        }
      })
    }
    catch(e){
      console.log("Error :",e)
      res.status(500).json({result:false})
    }
    })

    router.post('/bannereditpicture',upload.single('image'),function(req,res){
        try{
          console.log(req.body)
          console.log(req.file)
         pool.query("update banners set image=? where bannerid=?",[req.file.originalname,req.body.bannerId],function(error,result){
             if(error)
             {
               console.log(error)
               res.status(500).json({result:false})
             }
             else
             {
               console.log("Result",result)
               res.status(200).json({result:true})
             }
         })
        }
        catch(e)
        {
            console.log("Error:",e)
            res.status(500).json({result:false})
        }
       })

       router.post('/deletebanner',function(req,res){
        try{
          pool.query("delete from banners where bannerid=?",[req.body.bannerId],function(error,result){
          console.log(error)
          console.log(result)
            if(error)
            {
              res.status(500).json({result:false})
            }
            else{
              res.status(200).json({result:true})
            }
          })
        }
        catch(e){
          console.log("Error :",e)
          res.status(500).json({result:false})
        }
        })

module.exports=router