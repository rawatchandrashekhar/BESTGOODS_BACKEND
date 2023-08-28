var express=require('express')
var router=express.Router()
var pool=require('./pool')
var upload=require('./multer')

router.post('/colorsubmit',upload.single('icon'),function(req,res){
    try{
        console.log(req.body)
        console.log(req.file)
      pool.query("insert into colors(categoryid,subcategoryid,companyid,productid,color,icon) values(?,?,?,?,?,?)",[req.body.categoryid,req.body.subcategoryid,req.body.companyid,req.body.productid,req.body.color,req.file.originalname],function(error,result){
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

router.get('/displayallcolor',function(req,res){
    try{
       pool.query("select C.*,(select categoryname from categories Ca where Ca.categoryid=C.categoryid) as categoryname,(select subcategoryname from subcategories S where S.subcategoryid=C.subcategoryid) as subcategoryname,(select companyname from companies Co where Co.companyid=C.companyid) as companyname, (select productname from products Po where Po.productid=C.productid) as productname from colors C",function(error,result){
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

router.post('/displayallcolorbyproduct',function(req,res){
    try{
       pool.query("select C.*,(select categoryname from categories Ca where Ca.categoryid=C.categoryid) as categoryname,(select subcategoryname from subcategories S where S.subcategoryid=C.subcategoryid) as subcategoryname,(select companyname from companies Co where Co.companyid=C.companyid) as companyname, (select productname from products Po where Po.productid=C.productid) as productname from colors C where C.productid=?",[req.body.productid],function(error,result){
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

router.post('/updatecolordata',function(req,res){
    try{
        console.log(req.body)
        console.log(req.file)
      pool.query("update colors set categoryid=?,subcategoryid=?,companyid=?,productid=?,color=? where colorid=?",[req.body.categoryId,req.body.subCategoryId,req.body.companyId,req.body.productId,req.body.color,req.body.colorId],function(error,result){
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

router.post('/coloreditpicture',upload.single('icon'),function(req,res){
    try{
        console.log(req.body)
        console.log(req.file)
      pool.query("update colors set icon=? where colorid=?",[req.file.originalname,req.body.colorId],function(error,result){
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

router.post('/deletecolor',function(req,res){
    try{
        console.log(req.body)
        console.log(req.file)
      pool.query("delete from colors where colorid=?",[req.body.colorid],function(error,result){
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