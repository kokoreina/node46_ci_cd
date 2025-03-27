/**
 * https://docs.docker.com/reference/cli/docker/
 * 
 * 
 * image----------------
 * docker build tạo image :
 *  docker build -t image-be_cyber_media .
 * image list
 *  -docker image ls = docker image list
 * image remove 
 *  -docker image remove id_ten_image
 *  -docker image remove -f image-be_cyber_media && docker build -t image-be_cyber_media . (remove và build lại)
 * 
 * container ----------------
 * container run:
 *      -docker run -d -p 3070:3069 --name cons-be_cyber_media image-be_cyber_media
 * container list:
 *      -docker container ls = docker container list = docker ps  : lấy ra tất cả các container đang online
 *      -docker ps -a : lấy ra tất cả các container đang online và offline
 * 
 * Container restart :
 *      -docker container restart id_name_container
 * 
 * 
 * 
 * Terminal----------
 *      -docker logs id_ten_container
 * 
 * 
 * Tìm địa chỉ ip của một container (lưu ý trong môi trường docker)
 *      docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' id_name_DB_SQL_container
 * 
 * docker compose-------------------------
 * start :
 *      - docker compose up -d (-d không chiếm dụng terminal : chạy ngầm)
 * 
 * 
 * stop :
 *      - docker compose down
 * 
 * HUB------:
 *      - docker login
 *      - docker push name_container:tag
 */