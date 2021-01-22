# ------------------------------------------------------------
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
# ------------------------------------------------------------

import time
import requests
import os
from pprint import pprint

dapr_port = os.getenv("DAPR_HTTP_PORT", 3500)
dapr_url = "http://localhost:{}/v1.0/invoke/nodeapp/method/neworder".format(dapr_port)

n = 0
while True:
    n += 1
    message = {"data": {"orderId": n}}

    try:
        print("Going to call to http://localhost:{}/v1.0/invoke/nodeapp/method/neworder".format(dapr_port))
        response = requests.post(dapr_url, json=message)
        pprint("Response is {} {}".format(response.status_code,response.message))
    except Exception as e:
        print(e)

    time.sleep(1)
