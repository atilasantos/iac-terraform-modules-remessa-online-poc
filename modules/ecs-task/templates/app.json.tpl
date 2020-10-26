[
  {
    "essential": true,
    "memory": 256,
    "name": "${CONTAINER_NAME}",
    "cpu": 256,
    "image": "${REPOSITORY_URL}:1",
    "portMappings": [
        {
            "containerPort": ${CONTAINER_PORT},
            "hostPort": ${HOST_PORT}
        }
    ]
  }
]

