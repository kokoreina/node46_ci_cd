import video from "./video.swagger.js";

const swaggerDocument = {
    openapi: "3.1.0",
    info: {
        title: "BE Cyber Media",
        version: "1.0"
    },
    servers: [  // Sửa lỗi chính tả từ 'severs' thành 'servers'
        {
            url: "http://localhost:3069",
            description: "Server tại local",  // Sửa 'sever' thành 'server'
        },
    ],
    components: {
        securitySchemes: {
            huyToken: {
                type: "http",
                scheme: "bearer",
                bearerFormat: "JWT"
            }
        }
    },
    paths: {
        ...video
    }
};

export default swaggerDocument;
