FROM  ${{ secrets.DOCKERHUB_USERNAME }}/hello-world:latest

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["bash","/entrypoint.sh"]