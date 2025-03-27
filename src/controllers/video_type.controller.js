import video_typeService from "../services/video_type.service.js"


const video_typeController ={
    videp_typelist :async(req,res,next)=>{
        const video_type=await video_typeService.video_typeList()
        res.json(video_type)
    }
}
export default video_typeController