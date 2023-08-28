var express=require('express')
var router=express.Router()
var pool=require('./pool')
var upload=require('./multer')

router.post('/modelsubmit',upload.single('icon'),function(req,res){
    try{
        console.log(req.body)
        console.log(req.file)
      pool.query("insert into models(categoryid,subcategoryid,companyid,productid,modelname,modelsize,modelweight,icon) values(?,?,?,?,?,?,?,?)",[req.body.categoryid,req.body.subcategoryid,req.body.companyid,req.body.productid,req.body.modelname,req.body.modelsize,req.body.modelweight,req.file.originalname],function(error,result){
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

router.get('/displayallmodel',function(req,res){
    try{
       pool.query("select M.*,(select categoryname from categories Ca where Ca.categoryid=M.categoryid) as categoryname,(select subcategoryname from subcategories S where S.subcategoryid=M.subcategoryid) as subcategoryname,(select companyname from companies Co where Co.companyid=M.companyid) as companyname, (select productname from products Po where Po.productid=M.productid) as productname from models M",function(error,result){
           if(error){
               console.log(error)
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

router.post('/displayallmodelbyproduct',function(req,res){
    console.log(req.body)
    try{
       pool.query("select M.*,(select categoryname from categories Ca where Ca.categoryid=M.categoryid) as categoryname,(select subcategoryname from subcategories S where S.subcategoryid=M.subcategoryid) as subcategoryname,(select companyname from companies Co where Co.companyid=M.companyid) as companyname, (select productname from products Po where Po.productid=M.productid) as productname from models M where M.productid=?",[req.body.productid],function(error,result){
           if(error){
               console.log(error)
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

router.post('/updatemodeldata',function(req,res){
    try{
        console.log(req.body)
        console.log(req.file)
      pool.query("update models set categoryid=?,subcategoryid=?,companyid=?,productid=?,modelname=?,modelsize=?,modelweight=? where modelid=?",[req.body.categoryId,req.body.subCategoryId,req.body.companyId,req.body.productId,req.body.modelName,req.body.modelSize,req.body.modelWeight,req.body.modelId],function(error,result){
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

router.post('/modeleditpicture',upload.single('icon'),function(req,res){
    try{
        console.log(req.body)
        console.log(req.file)
      pool.query("update models set icon=? where modelid=?",[req.file.originalname,req.body.modelId],function(error,result){
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

router.post('/deletemodel',function(req,res){
    try{
        console.log(req.body)
        console.log(req.file)
      pool.query("delete from models where modelid=?",[req.body.modelid],function(error,result){
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