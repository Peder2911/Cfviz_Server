
sudo docker build -t "cfviz" .
sudo docker run --rm -p 3838:3838 --name visualserver cfviz
