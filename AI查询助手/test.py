import requests

# 远程服务器的基础URL
base_url = "http://192.144.228.147:6399"  # 将此处替换为你的服务器IP和端口

# 请求的JSON数据
data = {
    "model": "llama3_8b",  # 指定使用 Llama3 8B 模型
    "messages": [
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": "Can you tell me a fun fact about space?"}
    ]
}

try:
    # 发送POST请求到ollama API
    response = requests.post(f"{base_url}/api/chat", json=data)

    # 检查HTTP响应状态码
    if response.status_code == 200:
        print("成功连接到 Llama3 8B 模型。")
        print("模型响应：")
        print(response.json())
    else:
        print(f"请求失败，状态码: {response.status_code}")
        print("响应内容：", response.text)

except requests.exceptions.RequestException as e:
    print(f"连接失败: {e}")
