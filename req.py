import requests 
from requests.packages.urllib3.util.retry import Retry 
from requests.adapters import HTTPAdapter 
def espera_10():
    s = requests.Session() 
    retries = Retry(total=10,backoff_factor=0.1,status_forcelist=[ 500, 502, 503, 504 ])
    s.mount('https://coneyotl.herokuapp.com/correos/Enviar', HTTPAdapter(max_retries=retries))
    s.mount('https://coneyotl.herokuapp.com/correos', HTTPAdapter(max_retries=retries))
    s.mount('https://coneyotl.herokuapp.com', HTTPAdapter(max_retries=retries))
    s.mount('https://', HTTPAdapter(max_retries=retries))