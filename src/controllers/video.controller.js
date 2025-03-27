
import { responseSuccess } from "../common/helpers/respone.helper.js";
import videoService from "../services/video.service.js";

const videoController ={
    Videolist :async (req, res, next) => {
      try {
        const videos= await videoService.videoList(req)

        const resData=responseSuccess(videos,`Get list video successfully 123`,200)
    
        res.status(resData.code).json(resData);
      } catch (error) {
        next(error)
      }
    },
    videoDetail :async (req, res, next) => {
      try {
        const videos= await videoService.videoDetail(req)

        const resData=responseSuccess(videos,`Get Detail video successfully`,200)
    
        res.status(resData.code).json(resData);
      } catch (error) {
        next(error)
      }
    }
}
export default videoController