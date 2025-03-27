import jwt from "jsonwebtoken"
import { ACCESS_TOKEN_SECRET } from "../constant/app.constant.js"
import prisma from "../prisma/init.prisma.js"
import { UnauthorizationException } from "../helpers/error.helper.js"
export const protect= async (req,res,next)=>{
    try {
        const accesToken=req.headers.authorization?.split(" ")[1]
        // console.log(req.headers.authorization.split(" ")[1])
        console.log({accesToken})
        if(!accesToken){
            throw new UnauthorizationException(`Vui lòng cung cấp token để tiếp tục sử dụng`)
        }
        
        const decode=jwt.verify(accesToken,ACCESS_TOKEN_SECRET)

        const user= await prisma.users.findUnique({
            where:{
                user_id:decode.userId
            },
            include:{
                roles:true
            }
        })
        req.user=user
        next()
    } catch (error) {
        next(error)
    }

}