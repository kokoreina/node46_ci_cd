import express from "express";
import videoRouter from "./video.router.js";
import carRouter from "./car.router.js";
import chatRouter from "./chats.router.js";
import video_typeRouter from "./video_type.router.js";
import authRouter from "./auth.router.js";
import roleRouter from "./role.router.js";
import permissionRouter from "./permission.router.js";
import swaggerUi from 'swagger-ui-express'
import swaggerDocument from "../common/swagger/init.swagger.js";
import userRouter from "./user.router.js";
const rootRouter = express.Router()
rootRouter.use('/api-docs', swaggerUi.serve);
rootRouter.get('/api-docs', (req,res)=>{

  const urlNew=`${req.protocol}://${req.get('host')}`
  console.log({urlNew})
  const isUrl=swaggerDocument.servers.find((item)=>{
    const isFind=item.url=== urlNew
    return isFind
  })
  if(!isUrl){
    swaggerDocument.servers.unshift({
      url:urlNew,
      description:"Sever đang online"
    })
  }


  swaggerUi.setup(swaggerDocument,{swaggerOptions :{persistAuthorization : true}})(req,res)
});

rootRouter.get(`/`, (request, respone, next) => {
    respone.json("Ok ");
  });

rootRouter.use('/video',videoRouter)
rootRouter.use('/car',carRouter)
rootRouter.use('/chat',chatRouter)
rootRouter.use('/video_type',video_typeRouter)
rootRouter.use('/auth',authRouter)
rootRouter.use('/role',roleRouter)
rootRouter.use('/permission',permissionRouter)
rootRouter.use('/user',userRouter)
export default rootRouter