import { BadRequestException } from "../helpers/error.helper.js"
import prisma from "../prisma/init.prisma.js"

export const checkPermission = async (req,res,next) => {
  // gom dữ liệu cần thiết để kiểm tra permission
  try {
    const user=req.user
    const role_id=user.role_id
    const baseUrl=req.baseUrl
    const routePath= req.route.path
    const fullPath= baseUrl+routePath
    const method=req.method
    // Nếu là ADMIN (role_id ===1 ) thì cho qua 
    // Bắt buộc phải có return nếu không code sẽ chạy tiếp tục
    if(role_id ===1){
      return next()
    }
    console.log({
      role_id,
      fullPath,
      method
    })
    // Đi tìm id của permission thông qua fullpath,method
    const permission=await prisma.permissions.findFirst({
      where:{
        endpoint:fullPath,
        method:method
      }
    })
    const role_permissions = await prisma.role_permissions.findFirst({
      where :{
        permission_id: permission.permission_id,
        role_id: role_id,
        is_active: true
      }
    })
    if(!role_permissions){
      throw new BadRequestException(`Bạn không đủ quyền để sử dụng tài nguyên api`)
    }
    next()
  } catch (error) {
    next(error)
  }
}
