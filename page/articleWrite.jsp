<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/CSS" href="../css/main.css">
</head>
<body>
    
    <header>
        <div id="header_left">
            <a href="main.jsp">
                <button id = "logo" class="Btn">tistory</button>
            </a>
        </div>

        <div id='image_box'>
            <img id="image" src="../image/kakao.png">
        </div>

        <div id="header_right">
            <div class="Btn_box">
                <a href="postList.jsp">
                    <button class="Btn">글목록</button>
                </a>
            </div>
            <div class="Btn_box">
                <a href="profile.jsp">
                    <button class="Btn">내 정보</button>
                </a>
            </div>
            
            <div class="Btn_box">
                <a href="../action/logoutAction.jsp">
                    <button class="Btn">로그아웃</button>
                </a>
            </div>
        </div>
    </header>

    <div id="input_container">
        <p class="title">-------게시글 쓰기-------</p>

        <form action="../action/articleWriteAction.jsp">
            <div id="input_title">
                <input class="input" name="title_value" type="text" placeholder="게시글 제목">
            </div>

            <div id="input_content">
                <input class="input" name="content_value" type="text" placeholder="게시글 내용">
            </div>
            <div class="Btn_box">
                <input  class="input Btn" type="submit">
            </div>
        </form>
    </div>



    <script>


    </script>
</body>
</html>


