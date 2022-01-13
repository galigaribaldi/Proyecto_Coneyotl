import json
def sendResJson():
    return json.dumps(
        {
            'code': 201,
            'message': "Nuevo"
            }
        )