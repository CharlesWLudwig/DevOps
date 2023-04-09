docker build -t hello-world:latest -f- https://github.com/itjuana-bootcamp/DevOps.git <<EOF
COPY capstone_project/hello-world/src ./src
COPY capstone_project/hello-world/public ./public
FROM busybox
EOF