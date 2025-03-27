import express from "express";
import rootRouter from "./src/routers/root.router.js";
import { handleError } from "./src/common/helpers/error.helper.js";
import cors from "cors";
import { createServer } from "http";
import prisma from "./src/common/prisma/init.prisma.js";
import initSocket from "./src/common/socket/init.socket.js";
const app = express();

//middleware giúp phân dãi dử liệu từ json sang đối tượng javascript
app.use(express.json());

app.use(
  cors({
    origin: ["http://localhost:5173"],
    credentials: true,
  })
);
app.use(express.static("."))
app.use(rootRouter);

app.use(handleError);

const httpServer = createServer(app);

initSocket(httpServer)



httpServer.listen(3069, () => {
  console.log("Sever online at port 3069");
});

// console.log({env:process.env})

/**
 * PRISMA
 * 
 * 
 * 
 * 
 * 
 *  npm i prisma
 *  npm i @prisma/client
 * npx prisma init
 * tạo ra env
 * tạo ra prisma/schema.prisma
 * npx prisma db pull
 * npx prisma generate
 *
 *
 *
 * *** Cập nhập lại db
 *        prisma : chỉ cần 2 câu lệnh sau
 *              npx prisma db pull
 *              npx prisma generate
 *        sequelize
 *            sequelize-auto -h <host> -d <database> -u <user> -x [password] -p [port]  --dialect [dialect] -c [/path/to/config] -o [/path/to/models] -t [tableName]
 *  */

/**
 * đoạn code tạo accesstoken refreshtoken trên postman
 * const response = pm.response.json()

if(response.status === `error`) return

const accessToken = response.metaData.accessToken
const refreshToken = response.metaData.refreshToken

pm.globals.set("accessToken", accessToken);
pm.globals.set("refreshToken", refreshToken);
 */
// app.use(
//   (req,res,next) => {
//   console.log(`middleware 1`)
//   const payload=`payload`
//   res.payload=payload
//   next(123)
// },
// (req,res,next) => {
//   console.log(`middleware 2`)
//   console.log(res.payload)
//   next()
// },
// (err,req,res,next) => {
//   console.log(`middleware 3`)
//   next()
// }
// )
// code first : đi từ code tạo ra db,table
// tạo ra model từ define

// database first : đi từ câu lệnh sql tạo ra db
/** Đi từ câu lệnh SQL để tạo ra table
 * tạo table bằng câu lệnh sql
 * sequelize auto
 * sequelize-auto -h <host> -d <database> -u <user> -x [password] -p [port]  --dialect [dialect] -c [/path/to/config] -o [/path/to/models] -t [tableName]
 *  */

// // query paramaters
// // thường dùng khi muốn phân trang,search,filter
// app.get(`/query`, (request, respone, next) => {
//   respone.json(`query paramaters`);
//   console.log(request.query);
//   const { email, password } = request.query;
//   console.log(email, password);
// });
// //path paramaters
// //thường dùng khi muốn lấy chi tiết (detail) của một user , product ,...
// app.get(`/path/:id`, (request, respone, next) => {
//   console.log(request.params);
//   respone.json(`Path paramaters`);
// });
// // headers
// app.get(`/headers`, (request, respone, next) => {
//   console.log(request.headers);
//   respone.json(`Headers paramaters`);
// });
// // body
// // để nhận được dữ liệu từ body thì bắt buộc phải có
// // app.use(express.json())
// // hoặc sử dụng thư viện parser: https://www.npmjs.com/package/parser
// app.post(`/body`, (request, respone, next) => {
//   console.log(request.body);
//   respone.json(`Body paramaters`);
// });

/*

    // BE - ExpressJS CURD
    // Routes
    "Express CRUD Routes": {
      "scope": "javascript, javascriptreact, typescriptreact, typescript",
      "prefix": "express-router-crud",
      "body": [
          "import express from 'express';",
          "",
          "const ${1:module}Router = express.Router();",
          "",
          "// Tạo route CRUD",
          "${1:module}Router.post('/', ${1:module}Controller.create);",
          "${1:module}Router.get('/', ${1:module}Controller.findAll);",
          "${1:module}Router.get('/:id', ${1:module}Controller.findOne);",
          "${1:module}Router.patch('/:id', ${1:module}Controller.update);",
          "${1:module}Router.delete('/:id', ${1:module}Controller.remove);",
          "",
          "export default ${1:module}Router;"
      ],
      "description": "Snippet for Express CRUD routes"
  },
  "Express CRUD Controller": {
      "scope": "javascript, javascriptreact, typescriptreact, typescript",
      "prefix": "express-controller-crud",
      "body": [
          "export const ${1:module}Controller = {",
          "   create: async function (req, res, next) {",
          "      try {",
          "         const result = await ${2:${1:module}Service}.create(req);",
          "         const response = ${3:responseSuccess}(result, `Create ${1:module} successfully`);",
          "         res.status(response.code).json(response);",
          "      } catch (err) {",
          "         next(err);",
          "      }",
          "   },",
          "",
          "   findAll: async function (req, res, next) {",
          "      try {",
          "         const result = await ${1:module}Service.findAll(req);",
          "         const response = responseSuccess(result, `Get all ${1:module}s successfully`);",
          "         res.status(response.code).json(response);",
          "      } catch (err) {",
          "         next(err);",
          "      }",
          "   },",
          "",
          "   findOne: async function (req, res, next) {",
          "      try {",
          "         const result = await ${1:module}Service.findOne(req);",
          "         const response = responseSuccess(result, `Get ${1:module} #${req.params.id} successfully`);",
          "         res.status(response.code).json(response);",
          "      } catch (err) {",
          "         next(err);",
          "      }",
          "   },",
          "",
          "   update: async function (req, res, next) {",
          "      try {",
          "         const result = await ${1:module}Service.update(req);",
          "         const response = responseSuccess(result, `Update ${1:module} #${req.params.id} successfully`);",
          "         res.status(response.code).json(response);",
          "      } catch (err) {",
          "         next(err);",
          "      }",
          "   },",
          "",
          "   remove: async function (req, res, next) {",
          "      try {",
          "         const result = await ${1:module}Service.remove(req);",
          "         const response = responseSuccess(result, `Remove ${1:module} #${req.params.id} successfully`);",
          "         res.status(response.code).json(response);",
          "      } catch (err) {",
          "         next(err);",
          "      }",
          "   }",
          "};"
      ],
      "description": "Snippet for Express CRUD controller"
  },
  "Express CRUD Service": {
      "scope": "javascript, javascriptreact, typescriptreact, typescript",
      "prefix": "express-service-crud",
      "body": [
          "export const ${1:module}Service = {",
          "   create: async function (req) {",
          "      return `This action create`;",
          "   },",
          "",
          "   findAll: async function (req) {",
          "      return `This action returns all ${1:module}`;",
          "   },",
          "",
          "   findOne: async function (req) {",
          "      return `This action returns a id: ${req.params.id} ${1:module}`;",
          "   },",
          "",
          "   update: async function (req) {",
          "      return `This action updates a id: ${req.params.id} ${1:module}`;",
          "   },",
          "",
          "   remove: async function (req) {",
          "      return `This action removes a id: ${req.params.id} ${1:module}`;",
          "   },",
          "};"
      ],
      "description": "Snippet for Express CRUD service"
  }

  */
