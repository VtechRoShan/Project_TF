


import requests

for i in range(1000):
  response = requests.get('http://demo-alg-tf-13871479.us-east-1.elb.amazonaws.com/')
  data = response.json()
  print(data, end=' ')
  print(i)