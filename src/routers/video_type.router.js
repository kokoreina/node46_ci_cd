import express from "express";
import video_typeController from "../controllers/video_type.controller.js";


const video_typeRouter= express.Router()

video_typeRouter.get(`/video_type-list`,video_typeController.videp_typelist)

export default video_typeRouter