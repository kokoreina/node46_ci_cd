import { Sequelize } from "sequelize";
import initModels from "../../models/init-models.js";
import { DATABASE_URL } from "../constant/app.constant.js";

export const sequelize = new Sequelize(
  DATABASE_URL,{logging:false}
); // Example for postgres
//kiểm tra kết nối với cơ sở dữ liệu (db)
const models = initModels(sequelize)


sequelize
  .authenticate()
  .then(() => {
    console.log("kết nối với db thành công");
  })
  .catch(() => {
    console.log("kết nối với db thất bại");
  });

export default models