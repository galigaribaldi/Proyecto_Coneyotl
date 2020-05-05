import os
import redis
import urllib.parse
from redis import Redis
from rq import Worker, Queue, Connection

listen = ['high', 'default', 'low']

redis_url = os.getenv('REDISTOGO_URL', 'redis://localhost:6379')
#redis_url = os.getenv('REDISTOGO_URL')
print(redis_url)
urllib.parse.uses_netloc.append("redis") 
url = urllib.parse.urlparse(os.environ["REDISTOGO_URL"])
conn = Redis(host=url.hostname, port=url.port, db=0, password=url.password)

if __name__ == '__main__':
    with Connection(conn):
        worker = Worker(map(Queue, listen))
        worker.work()