from flask import Flask, render_template
import pandas as pd
import openpyxl
import fsspec

app = Flask(__name__)

@app.route('/usr/bus2')
def index():
    # 엑셀 파일을 읽어옴
    df = pd.read_excel('bustime.xlsx')

    # 데이터를 HTML로 변환
    html = df.to_html()

    # HTML 템플릿 파일을 렌더링
    return render_template('bus/bus2.jsp', table=html)

if __name__ == '__main__':
    app.run()

# 엑셀 파일 읽기
#data = pd.read_excel('bustime.xls')

# 리스트 출력
#my_list = data.values.tolist()
#print(my_list)