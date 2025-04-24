
import hashlib
text = input("enter any text")

text_encode = text.encode()

text_hash = hashlib.sha256(text_encode)

text_hex = text_hash.hexdigest()

print(text_hex)
