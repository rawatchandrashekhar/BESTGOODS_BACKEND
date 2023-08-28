var express=require('express')
var router=express.Router()
var pool=require('./pool')
var upload=require('./multer')

router.post('/productsubmit',upload.single('icon'),function(req,res){
    try{
        console.log(req.body)
        console.log(req.file)
      pool.query("insert into products(categoryid,subcategoryid,companyid,productname,description,continueordiscontinue,icon) values(?,?,?,?,?,?,?)",[req.body.categoryid,req.body.subcategoryid,req.body.companyid,req.body.productname,req.body.description,req.body.continueordiscontinue,req.file.originalname],function(error,result){
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

router.get('/displayallproduct',function(req,res){
    try{
       pool.query("select P.*,(select categoryname from categories C where C.categoryid=P.categoryid) as categoryname,(select subcategoryname from subcategories S where S.subcategoryid=P.subcategoryid) as subcategoryname,(select companyname from companies Co where Co.companyid=P.companyid) as companyname from products P",function(error,result){
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

router.post('/displayallproductbycompany',function(req,res){
    try{
       pool.query("select P.*,(select categoryname from categories C where C.categoryid=P.categoryid) as categoryname,(select subcategoryname from subcategories S where S.subcategoryid=P.subcategoryid) as subcategoryname,(select companyname from companies Co where Co.companyid=P.companyid) as companyname from products P where P.companyid=?",[req.body.companyid],function(error,result){
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

router.post('/displayallcompanybysubcategory',function(req,res){
    try{
       pool.query("select P.*,(select categoryname from categories C where C.categoryid=P.categoryid) as categoryname,(select subcategoryname from subcategories S where S.subcategoryid=P.subcategoryid) as subcategoryname,(select companyname from companies Co where Co.companyid=P.companyid) as companyname from products P where P.subcategoryid=?",[req.body.subcategoryid],function(error,result){
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

router.post('/updateproductdata',function(req,res){
    try{
        console.log(req.body)
        console.log(req.file)
      pool.query("update products set categoryid=?,subcategoryid=?,companyid=?,productname=?,description=?,continueordiscontinue=? where productid=?",[req.body.categoryId,req.body.subCategoryId,req.body.companyId,req.body.productName,req.body.description,req.body.continueOrDiscontinue,req.body.productId],function(error,result){
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

router.post('/producteditpicture',upload.single('icon'),function(req,res){
    try{
        console.log(req.body)
        console.log(req.file)
      pool.query("update products set icon=? where productid=?",[req.file.originalname,req.body.productId],function(error,result){
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

router.post('/deleteproduct',function(req,res){
    try{
        console.log(req.body)
        console.log(req.file)
      pool.query("delete from products where productid=?",[req.body.productid],function(error,result){
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