import { BadRequestException } from "../common/helpers/error.helper.js"
import Cars from "../models/Cars.model.js"

const carService ={
    carList : async (req)=>{
        // Lỗi kiểm soát được 
        // Mã code :400,403,401
        // const passNguoiDungGuiLen=123
        // const passLayTrongDB=1235
        // if(passNguoiDungGuiLen!==passLayTrongDB){
        //     throw new BadRequestException(`Mật khẩu không chính xác`)
        // }


        //Lỗi không kiểm soát được 
        // mã code :500
        // console.log(abc)



         const cars= await Cars.findAll({raw:true})

         return cars
    }
}
export default carService