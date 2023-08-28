var express=require('express')
var router=express.Router()
var pool=require('./pool')
var upload=require('./multer')

router.post('/finalproductsubmit',upload.single('icon'),function(req,res){
    try{
        console.log(req.body)
        console.log(req.file)
      pool.query("insert into finalproducts(categoryid,subcategoryid,companyid,productid,colorid,modelid,sizeid,price,stock,offerprice,description,icon,productstatus) values(?,?,?,?,?,?,?,?,?,?,?,?,?)",[req.body.categoryid,req.body.subcategoryid,req.body.companyid,req.body.productid,req.body.colorid,req.body.modelid,req.body.sizeid,req.body.price,req.body.stock,req.body.offerprice,req.body.description,req.file.originalname,req.body.productstatus],function(error,result){
         if(error){
             console.log(error)
             res.status(500).json({result:false})
         }else{
             console.log("RESULT",result)
            res.status(200).json({result:true,finalproductid:result.insertId})
         }       
      })
    }catch(e){
        console.log("Error : ",e)
        res.status(500).json({result:false})
    }
})

router.get('/displayallfinalproduct',function(req,res){
    try{
       pool.query("select FP.*,(select categoryname from categories Ca where Ca.categoryid=FP.categoryid) as categoryname,(select subcategoryname from subcategories S where S.subcategoryid=FP.subcategoryid) as subcategoryname,(select companyname from companies Co where Co.companyid=FP.companyid) as companyname, (select productname from products Po where Po.productid=FP.productid) as productname, (select color from colors C where C.colorid=FP.colorid) as colorname, (select modelname from models M where M.modelid=FP.modelid) as modelname, (select modelsize from models MS where MS.modelid=FP.modelid) as modelsize from finalproducts FP",function(error,result){
           if(error){
               console.log(error)
               res.status(500).json({data:[]})
           }else{
               console.log("RESULT",result)
               res.status(200).json({data:result})
           }
       })
    }catch(e){
        console.log("Error : ",e)
        res.status(500).json({result:[]})         
    }
})

router.get('/displayallfinalproducttrending',function(req,res){
    try{
       pool.query("select FP.*,(select categoryname from categories Ca where Ca.categoryid=FP.categoryid) as categoryname,(select subcategoryname from subcategories S where S.subcategoryid=FP.subcategoryid) as subcategoryname,(select companyname from companies Co where Co.companyid=FP.companyid) as companyname, (select productname from products Po where Po.productid=FP.productid) as productname, (select color from colors C where C.colorid=FP.colorid) as colorname, (select modelname from models M where M.modelid=FP.modelid) as modelname, (select modelsize from models MS where MS.modelid=FP.modelid) as modelsize from finalproducts FP where FP.productstatus='Trending'",function(error,result){
           if(error){
               console.log(error)
               res.status(500).json({data:[]})
           }else{
               console.log("RESULT",result)
               res.status(200).json({data:result})
           }
       })
    }catch(e){
        console.log("Error : ",e)
        res.status(500).json({result:[]})         
    }
})

router.post('/displayallfinalproductbysubcategoryid',function(req,res){
    try{
       pool.query("select FP.*,(select categoryname from categories Ca where Ca.categoryid=FP.categoryid) as categoryname,(select subcategoryname from subcategories S where S.subcategoryid=FP.subcategoryid) as subcategoryname,(select companyname from companies Co where Co.companyid=FP.companyid) as companyname, (select productname from products Po where Po.productid=FP.productid) as productname, (select color from colors C where C.colorid=FP.colorid) as colorname, (select modelname from models M where M.modelid=FP.modelid) as modelname, (select modelsize from models MS where MS.modelid=FP.modelid) as modelsize from finalproducts FP where FP.subcategoryid=?",[req.body.subcategoryid],function(error,result){
           if(error){
               console.log(error)
               res.status(500).json({data:[]})
           }else{
               console.log("RESULT",result)
               res.status(200).json({data:result})
           }
       })
    }catch(e){
        console.log("Error : ",e)
        res.status(500).json({result:[]})         
    }
})

router.post('/updatefinalproductdata',function(req,res){
    try{
        console.log(req.body)
        console.log(req.file)
      pool.query("update finalproducts set categoryid=?,subcategoryid=?,companyid=?,productid=?,colorid=?,modelid=?,sizeid=?,price=?,stock=?,offerprice=?,description=? where finalproductid=?",[req.body.categoryId,req.body.subCategoryId,req.body.companyId,req.body.productId,req.body.colorId,req.body.modelId,req.body.sizeId,req.body.price,req.body.stock,req.body.offerPrice,req.body.description,req.body.finalProductId],function(error,result){
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

router.post('/finalproducteditpicture',upload.single('icon'),function(req,res){
    try{
        console.log(req.body)
        console.log(req.file)
      pool.query("update finalproducts set icon=? where finalproductid=?",[req.file.originalname,req.body.finalProductId],function(error,result){
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

router.post('/savemorepictures',upload.any(),function(req,res){
    console.log(req.body)
    console.log(req.file)
    try{
        var q="insert into morepictures(finalproductid,image)values ?"
      pool.query(q,[req.files.map((item)=>[req.body.finalproductid,item.filename])],function(error,result){
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

router.post('/deletefinalproduct',function(req,res){
    try{
        console.log(req.body)
        console.log(req.file)
      pool.query("delete from finalproducts where finalproductid=?",[req.body.finalproductid],function(error,result){
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