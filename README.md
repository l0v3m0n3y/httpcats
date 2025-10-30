# httpcats
cats http status code httpcats.com
# Example
```nim
import asyncdispatch, httpcats, json
stdout.write "Введите http status: "
let status= parseInt(stdin.readLine().strip())
let data = waitFor get_staus(status)
let images = data["image"]
let jpg = data["jpg"].getStr()
echo jpg
```
# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
