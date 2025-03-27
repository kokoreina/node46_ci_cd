import { responeError, responseSuccess } from "../common/helpers/respone.helper.js";
import carService from "../services/car.service.js";

const carController = {
  carList: async (req, res, next) => {
    try {
      const cars = await carService.carList(req);

      const resData = responseSuccess(cars, `Get list car Successfully`, 200);

      res.status(resData.code).json(resData);
    } catch (error) {

      next(error)
    }
  },
};
export default carController;
