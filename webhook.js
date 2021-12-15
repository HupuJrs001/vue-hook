let http = require('http');
let crypto = require('crypto');
function sign(body){

}
let server = http.createServer(function(req,res){
    console.log('req',req.method,req.url)
  if(req.method =='POST' && req.url=='/webhook'){

       res.setHeader('Content-Type','application/json');
       res.end(JSON.stringify({ok:true}))
  } else {
      res.end('Not Found')
  }
})
server.listen(4000,()=>{
    console.log('webhook服务已经在4000端口启动')
})
