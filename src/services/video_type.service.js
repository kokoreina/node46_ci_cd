import models from "../common/sequelize/init.sequelize.js"

const video_typeService ={
    video_typeList : async()=>{
        const video_type= await models.video_type.findAll({raw:true})
        return video_type
    }
}
export default video_typeService