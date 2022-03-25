<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

		<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>HELLO SMART WORLD</title>
        
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon1.ico"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet"/>


       
        <style type="text/css">
            *{box-sizing:board-box;}
            .video-film {box-shadow: rgba(0, 7, 15, 0.7) 0 0 0 9999px; z-index: 100;}
            .video-background {
                background: #000; position: fixed;
                top: 0; right: 0; bottom: 0; left: 0; z-index: -99;
            }
            .video-foreground, .video-background iframe {
                position: absolute; top: 0; left: 0;
                width: 100%; height: 100%; pointer-events: none;
            }
            @media ( min-aspect-ratio : 16/9) {
                .video-foreground {height: 300%; top: -100%;}
            }
            @media ( max-aspect-ratio : 16/9) {
                .video-foreground {width: 300%; left: -100%;}
            }
            h1 {color: white;}
            #visual-btn {
                z-index: 50; color: #fff; font-size: 20px; border: 2px solid #fff;
                padding: 12px 24px; border-radius: 5px; cursor: pointer; background-color: rgba(0, 0, 0, 0);
            }
            #visual-btn:hover {
                color: #ff6868; font-size: 20px; border: 2px solid #ff6868;
                padding: 12px 24px; border-radius: 5px; cursor: pointer;
            }
            #indexBtn {position: fixed; text-align: center}
            .center {position: absolute; top: 60%; left: 47%; margin: -50px 0 0 -50px;}
        </style>


</head>
<body>

        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; HELLO SMART WORLD</p>
            <p class="m-0 text-center text-white">김민지 김민보 한채영</p>
            <p class="m-0 text-center text-white"><i class="bi bi-clock"></i> MON-FRI AM9:00 - PM15:30 | <i class="bi bi-envelope"></i> java_job@kh.ac.kr</p>
            <br>
            <p class="m-0 text-center text-white">사업자번호 | 901-84-271542</p>
            <p class="m-0 text-center text-white">통신판매업번호 | 2022-서울KH-0012호</p>
            
            </div>
        </footer>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>
</html>