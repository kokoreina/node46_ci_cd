import {
  ACCESS_TOKEN_EXPIRED,
  ACCESS_TOKEN_SECRET,
  REFRESH_TOKEN_EXPIRED,
  REFRESH_TOKEN_SECRET,
} from "../common/constant/app.constant.js";
import { BadRequestException, UnauthorizationException } from "../common/helpers/error.helper.js";
import sendMail from "../common/nodemailer/send-mail.nodemailer.js";
import prisma from "../common/prisma/init.prisma.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
const authService = {
  // api

  register: async (req) => {
    // Bước 1: nhận dữ liệu full_name, email, password
    const { full_name, email, pass_word } = req.body;
    // console.log({ full_name, email, pass_word });
    // Bước 2: Lấy email và kiểm tra trong db xem đã có người dùng đó hay chưa
    const userExits = await prisma.users.findFirst({
      where: {
        email: email,
      },
    });
    // console.log(userExits);
    if (userExits) {
      throw new BadRequestException(`Tài khoản đã tồn tại vui lòng đăng nhập`);
    }
    // mã hoá password
    const pashHash = bcrypt.hashSync(pass_word, 10);
    // Bước 3: Tạo người dùng mới
    const userNew = await prisma.users.create({
      data: {
        email: email,
        full_name: full_name,
        pass_word: pashHash,
      },
    });
    console.log({ userNew });
    // Xoá password khi trả về
    delete userNew.pass_word;

    // gửi email chào mừng 
    // 1 - tốc độ đăng ký nhanh và không cần đợi quá trình xử lý email => bỏ await
    // 2 chắc chắn : đăng ký chậm và cần phải đợi email gửi thành công => await
    sendMail(email).catch((err)=>{
      console.log(`Lỗi gửi email`,err)
    })
    // userNew.email=1234
    // Bước 4: Trả kết quả thành công
    return userNew;
  },
  login: async (req) => {
    const { email, pass_word } = req.body;
    console.log({ email, pass_word });

    const userExits =  await prisma.users.findFirst({
      where: {
        email: email,
      },
    });
    if (!userExits) {
      throw new BadRequestException(`Tài khoản chưa tồn tại vui lòng đăng ký`);
    }
    if (!userExits.pass_word) {
      if (userExits.face_app_id) {
        throw new BadRequestException(
          `Vui lòng đăng nhập bằng facebook, để tạo tài khoản mới`
        );
      }
      if (userExits.goole_id) {
        throw new BadRequestException(
          `Vui lòng đăng nhập bằng google, để tạo tài khoản mới`
        );
      }
      throw new BadRequestException(
        `Không hợp lệ vui lòng liên hệ chăm sóc khách hàng`
      );
    }
    //so sánh password
    const isPassword = bcrypt.compareSync(pass_word, userExits.pass_word);
    if (!isPassword) {
      throw new BadRequestException(`Mật khẩu không chính xác`);
    }
    const tokens = authService.createTokens(userExits.user_id);
    return tokens;
  },
  facebookLogin: async (req) => {
    const { name, email, picture, id } = req.body;
    const avatar = picture.data.url;
    console.log({ name, email, avatar, id });
    let userExits = await prisma.users.findFirst({
      where: {
        email: email,
      },
    });
    if (!userExits) {
      userExits = await prisma.users.create({
        data: {
          email: email,
          full_name: name,
          face_app_id: id,
        },
      });
    }
    const tokens = authService.createTokens(userExits.user_id);
    return tokens;
  },
  refreshToken: async (req) => {
    const refreshToken = req.headers.authorization?.split(" ")[1];
    // console.log(req.headers.authorization.split(" ")[1])
    if (!refreshToken) {
      throw new UnauthorizationException(
        `Vui lòng cung cấp token để tiếp tục sử dụng`
      );
    }
    const accessToken=req.headers[`x-access-token`]
    if (!accessToken) {
      throw new UnauthorizationException(
        `Vui lòng cung cấp token để tiếp tục sử dụng`
      );
    }
    const decodeRefreshToken= jwt.verify(refreshToken,REFRESH_TOKEN_SECRET)
    const decodeAccessToken= jwt.verify(accessToken,ACCESS_TOKEN_SECRET,{ignoreExpiration :true})
    console.log({
      decodeRefreshToken,
      decodeAccessToken,
      

    })
    if(decodeRefreshToken.userId !==decodeAccessToken.userId){
      throw new UnauthorizationException(`Cặp token khôn hợp lệ`)
    }
    const userExits=await prisma.users.findUnique({
      where :{
        user_id :decodeRefreshToken.userId,
      }
    })
    if(!userExits){
      throw new UnauthorizationException(`user không tồn tại `)
    }
    const tokens=authService.createTokens(userExits.user_id)
    return tokens;
  },
  getInfo:async (req) => {
    delete req.user.pass_word
    return req.user
  },
  // function
  createTokens: (userId) => {
    if (!userId) throw new BadRequestException(`Không có userId để tạo token`);
    const accessToken = jwt.sign({ userId: userId }, ACCESS_TOKEN_SECRET, {
      expiresIn: ACCESS_TOKEN_EXPIRED,
    });
    const refreshToken = jwt.sign({ userId: userId }, REFRESH_TOKEN_SECRET, {
      expiresIn: REFRESH_TOKEN_EXPIRED,
    });
    return {
      accessToken: accessToken,
      refreshToken: refreshToken,
    };
  },
};

export default authService;
