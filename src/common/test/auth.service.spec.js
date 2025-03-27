import { afterEach, beforeEach, describe, expect, it, jest } from "@jest/globals";
import authService from "../../services/auth.service.js";
import prisma from "../prisma/init.prisma.js";
import { REGEX_EMAIL } from "../constant/app.constant.js";

// describe : tiêu đề, gom nhóm các case(trường hợp)

// it : cụ thể một case 

// beforeEach : chạy trước mỗi lần hàm it chạy , thường dùng để khởi tạo dữ liệu đầu vào 
// afterEach : chạy sau mỗi lần hàm it chạy  , thường dùng để làm mới lại dữ liệu

describe("Auth Service", () => {
    beforeEach(() => {
      // console.log("before each chạy")
      jest.spyOn(prisma.users,`create`)
      jest.spyOn(prisma.users,`findFirst`)
    }
    )

    afterEach(() => {
      // console.log("after each chaỵ")
      jest.restoreAllMocks()
    }
    )
  it("Case 1: Trường hợp đăng ký thành công với thông tin hợp lệ", async () => {
    // console.log("case 1")

    // giả lập dữ liệu đầu ra của 2 hàm find first và create với trường hợp thông tin hợp lệ
    await prisma.users.findFirst.mockResolvedValue(undefined)
    await prisma.users.create.mockResolvedValue({
      user_id: 16,
      email: 'nguyenvana@gmail.com',
      pass_word: '$2b$10$TtoMA4LFXwhmpBIuCSSVV.s3eYU403eR96.HqDkEycLoGeCGcJjCC',
      full_name: 'nguyenvana',
      avatar: null,
      goole_id: null,
      face_app_id: null,
      created_at: '2025-02-19T08:16:59.000Z',
      updated_at: '2025-02-19T08:16:59.000Z',
      role_id: 2
    })


    const req= {
      body:{
        full_name:"nguyenvana",
        email:"nguyenvana@gmail.com",
        pass_word:"1234"
      }
    }
    const userNew=await authService.register(req)
    console.log({userNew})
    // kiểm tra kết quả 
    expect(userNew).not.toHaveProperty("pass_word")// không được có key pass_word
    
    expect(typeof userNew.email).toBe("string")// email phải là chuỗi 
    console.log(REGEX_EMAIL.test(userNew.email))
    expect(REGEX_EMAIL.test(userNew.email)).toBe(true)// email phải đúng định dạng 
  });
  it("Case 2: Trường hợp đăng ký email đã tồn tại, cần phải báo lỗi", () => {
    // console.log("case 2")
  });

});
