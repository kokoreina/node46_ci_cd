import multer from "multer"
import path from "path"
// Nơi lưu trữ (lưu pixcel data hình ảnh ) xử lý tên file và đuôi mở rộng (extension)
const storage = multer.diskStorage({
    // xử lý nơi lưu trữ
    destination: function (req, file, cb) {
        // có req để xử lý logic và folder muốn lưu trữ (file : image,docx,excel,pdf)
      cb(null, 'images/')
    },
    // xử lý tên file 
    filename: function (req, file, cb) {
      const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9)
      // fileExtension ( đuôi mở rộng của file)
      const fileExtension= path.extname(file.originalname)
      const fileNameString= `local-`+ file.fieldname + '-' + uniqueSuffix + fileExtension

      cb(null,fileNameString)
    }
  })
const uploadLocal = multer({ storage:storage })

export default uploadLocal