import cv2
import pytesseract
import re
from .ingredients import *

def extract_receipt(img):
    # img = cv2.imread(image)
    extracted_text = pytesseract.image_to_string(img, lang='eng')
    # print(extracted_text)
    
    all_items = []
    item_pattern = r'^(\d[X]\s)?(\d+)\s(.*[A-Z])\s\$\s([0-9].+)\s*$'
    result = re.findall(item_pattern, extracted_text, re.M)
    
    for index in result:
        all_items.append(index[2].lower())
    
    ing_compared = [i for i in ingredients if any(j in i for j in all_items)]
    
    ing_compared_str = ','.join(ing_compared)
    
    return ing_compared_str