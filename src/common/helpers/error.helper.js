import multer from "multer";
import { responeError } from "./respone.helper.js";
import jwt from "jsonwebtoken"

export const handleError = (err,req,res,next) => {

  //401 :log out
  //403 : refresh token
  // 2 mã này sẽ do FE và BE tự quy định với nhau 
  if(err instanceof jwt.JsonWebTokenError){
    err.code=401
  }
  if(err instanceof jwt.TokenExpiredError){
    err.code=403
  }
  if (err instanceof multer.MulterError) {
    err.code=400
  } 
  const resData=responeError(err.message,err.code,err.stack)
  res.status(resData.code).json(resData)

}

export class BadRequestException extends Error {
  constructor(messsage = `BadRequestException`) {
    super(messsage);
    this.code=400
  }
}
new BadRequestException(`Pass không chính xác `);
export class ForbiddenException extends Error {
    constructor(messsage = `ForbiddenException`) {
      super(messsage);
      this.code=403
    }
  }
  export class UnauthorizationException extends Error {
    constructor(messsage = `UnauthorizationException`) {
      super(messsage);
      this.code=401
    }
  }