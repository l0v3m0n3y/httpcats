# httpcats
cats http status code httpcats.com
# Example
```nim
import asyncdispatch, httpcats, json, strutils
stdout.write "Введите http status: "
let status= parseInt(stdin.readLine().strip())
let data = waitFor get_staus(status)
let images = data["image"]
let jpg = images["jpg"].getStr()
let filename="status_" & $status & ".jpg"
discard waitFor save_image(jpg,filename)
```
# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
