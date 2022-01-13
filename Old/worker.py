import os

import redis
from rq import Worker, Queue, Connection
from urllib.parse import urlparse

listen = ['high', 'default', 'low']

redis_url = os.environ.get('REDISCLOUD_URL')

print("Este es el URL:", redis_url)
conn = redis.from_url(redis_url)


if __name__ == '__main__':
    with Connection(conn):
        worker = Worker(map(Queue, listen))
        worker.work()