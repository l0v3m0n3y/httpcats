import asyncdispatch, httpclient, json , strutils

proc get_staus*(status:int): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = newHttpHeaders({"Connection": "keep-alive","X-Requested-With":"XMLHttpRequest","host": "httpcats.com", "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36"})
    let url = "https://httpcats.com/" & $status & ".json"
    let response = await client.get(url)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()


proc save_image*(url:string,filename:string):Future[bool] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = newHttpHeaders({"Connection": "keep-alive","X-Requested-With":"XMLHttpRequest","host": "httpcats.com", "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36"})
    let req = await client.get(url)
    let content = await req.body
    if content.len > 0:
        writeFile(filename, content)
        return true
  finally:
    client.close()
